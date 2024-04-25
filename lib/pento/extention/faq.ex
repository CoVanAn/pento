defmodule Pento.Extention.FAQ do
  use Ecto.Schema
  import Ecto.Changeset

  schema "faqs" do
    field :question, :string
    field :answer, :string
    field :vote_count, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(faq, attrs) do
    faq
    |> cast(attrs, [:question, :answer, :vote_count])
    |> validate_required([:question, :answer, :vote_count])
  end
end
