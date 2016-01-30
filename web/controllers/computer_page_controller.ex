defmodule ComputerStore.ComputerPageController do
  use ComputerStore.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, _params) do
    render conn, "show.html"
  end

  def edit(conn, _params) do
    render conn, "edit.html"
  end

end