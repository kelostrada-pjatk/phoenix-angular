defmodule ComputerStore.ComputerControllerTest do
  use ComputerStore.ConnCase

  alias ComputerStore.Computer
  @valid_attrs %{cpu: "some content", drive: "some content", gpu: "some content", mainboard: "some content", name: "some content", price: "120.5", ram: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, computer_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    computer = Repo.insert! %Computer{}
    conn = get conn, computer_path(conn, :show, computer)
    assert json_response(conn, 200)["data"] == %{"id" => computer.id,
      "name" => computer.name,
      "price" => computer.price,
      "cpu" => computer.cpu,
      "gpu" => computer.gpu,
      "ram" => computer.ram,
      "mainboard" => computer.mainboard,
      "drive" => computer.drive}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, computer_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, computer_path(conn, :create), computer: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Computer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, computer_path(conn, :create), computer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    computer = Repo.insert! %Computer{}
    conn = put conn, computer_path(conn, :update, computer), computer: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Computer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    computer = Repo.insert! %Computer{}
    conn = put conn, computer_path(conn, :update, computer), computer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    computer = Repo.insert! %Computer{}
    conn = delete conn, computer_path(conn, :delete, computer)
    assert response(conn, 204)
    refute Repo.get(Computer, computer.id)
  end
end
