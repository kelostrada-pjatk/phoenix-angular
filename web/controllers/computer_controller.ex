defmodule ComputerStore.ComputerController do
  use ComputerStore.Web, :controller

  alias ComputerStore.Computer

  plug :scrub_params, "computer" when action in [:create, :update]

  def index(conn, _params) do
    computers = Repo.all(Computer)
    render(conn, "index.json", computers: computers)
  end

  def create(conn, %{"computer" => computer_params}) do
    changeset = Computer.changeset(%Computer{}, computer_params)

    case Repo.insert(changeset) do
      {:ok, computer} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", computer_path(conn, :show, computer))
        |> render("show.json", computer: computer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ComputerStore.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    computer = Repo.get!(Computer, id)
    render(conn, "show.json", computer: computer)
  end

  def update(conn, %{"id" => id, "computer" => computer_params}) do
    computer = Repo.get!(Computer, id)
    changeset = Computer.changeset(computer, computer_params)

    case Repo.update(changeset) do
      {:ok, computer} ->
        render(conn, "show.json", computer: computer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ComputerStore.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    computer = Repo.get!(Computer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(computer)

    send_resp(conn, :no_content, "")
  end
end
