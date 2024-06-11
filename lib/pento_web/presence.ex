defmodule PentoWeb.Presence do
  alias PentoWeb.Presence
  @user_activity_topic "user_activity"
  use Phoenix.Presence,
  otp_app: :pento,
  pubsub_server: Pento.PubSub

  def track_user(pid, product, user_email) do
    Presence.track(
      pid,
      @user_activity_topic,
      product.name,
      %{users: [%{email: user_email}]}
    )
  end

  def list_products_and_users do
    Presence.list(@user_activity_topic)
    |> Enum.map(&extract_product_with_users/1)
  end

  defp extract_product_with_users({product, %{metas: metas}}) do
    {product.name, users_from_meta_list(metas)}
  end

  defp users_from_meta_list(metas_list) do
    Enum.map(metas_list, &users_from_meta_map/1)
    |> List.flatten()
    |> Enum.uniq()
  end

  defp users_from_meta_map(meta) do
    get_in(meta, [:users])
  end

end
