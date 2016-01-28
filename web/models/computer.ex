defmodule ComputerStore.Computer do
  use ComputerStore.Web, :model

  schema "computers" do
    field :name, :string
    field :price, :float
    field :cpu, :string
    field :gpu, :string
    field :ram, :integer
    field :mainboard, :string
    field :drive, :string

    timestamps
  end

  @required_fields ~w(name price cpu gpu ram mainboard drive)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
