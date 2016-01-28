defmodule ComputerStore.ComputerTest do
  use ComputerStore.ModelCase

  alias ComputerStore.Computer

  @valid_attrs %{cpu: "some content", drive: "some content", gpu: "some content", mainboard: "some content", name: "some content", price: "120.5", ram: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Computer.changeset(%Computer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Computer.changeset(%Computer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
