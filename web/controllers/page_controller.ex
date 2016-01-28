defmodule ComputerStore.PageController do
  use ComputerStore.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
