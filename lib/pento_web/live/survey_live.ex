defmodule PentoWeb.SurveyLive do
  alias Pento.Survey
  use PentoWeb, :live_view
  alias PentoWeb.SurveyLive.Component

  alias PentoWeb.DemographicLive



  # use CoreComponents.table

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_demographic}
  end

  defp assign_demographic(%{assigns: %{current_user: current_user}} = socket) do
    assign(
      socket,
      :demographic,
      Survey.get_demographic_by_user_id(current_user)
    )
  end

  def handle_info({:created_demographic, demographic}, socket) do
    {:noreply, handle_demographic_created(socket, demographic)}
  end

  def handle_demographic_created(socket, demographic) do
    socket
    |> put_flash(:info, "Demographic created successfully")
    |> assign(:demographic, demographic)
  end

end
