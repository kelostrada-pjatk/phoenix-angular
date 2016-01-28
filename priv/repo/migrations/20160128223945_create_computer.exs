defmodule ComputerStore.Repo.Migrations.CreateComputer do
  use Ecto.Migration

  def change do
    create table(:computers) do
      add :name, :string
      add :price, :float
      add :cpu, :string
      add :gpu, :string
      add :ram, :integer
      add :mainboard, :string
      add :drive, :string

      timestamps
    end

  end
end
