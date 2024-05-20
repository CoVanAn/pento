defmodule Pento.Catalog.Product do
  use Ecto.Schema
  alias Pento.Repo
  import Ecto.Changeset
  alias Pento.Survey.Rating

  schema "products" do
    field :name, :string
    field :description, :string
    field :unit_price, :float
    field :sku, :integer
    field :image_upload, :string

    timestamps()

    has_many :ratings, Rating
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :unit_price, :sku, :image_upload])
    |> validate_required([:name, :description, :unit_price, :sku])
    |> unique_constraint(:sku)
    |> validate_number(:unit_price, greater_than: 0.0)
    |> validate_price_decrease(:unit_price)
end


  defp validate_price_decrease(changeset, field) do
    current_price = get_field(changeset, field)
    new_price = get_change(changeset, field)

    if new_price && current_price && new_price > current_price do
      add_error(changeset, field, "cannot be increased")
    else
      changeset
    end
  end


  def price_decrease_changeset(product, attrs) do
    product
    |> cast(attrs, [:unit_price])
    |> validate_required([:unit_price])
    |> validate_number(:unit_price, greater_than: 0.0)
    |> validate_price_decrease(:unit_price)
  end

  def markdown_product(product, markdown_amount) do
    new_price = product.unit_price - markdown_amount
    changeset = price_decrease_changeset(product, %{unit_price: new_price})
    case Repo.update(changeset) do
      {:ok, product} -> {:ok, product}
      {:error, changeset} -> {:error, changeset}
    end
  end

end
