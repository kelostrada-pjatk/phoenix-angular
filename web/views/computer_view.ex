defmodule ComputerStore.ComputerView do
  use ComputerStore.Web, :view

  def render("index.json", %{computers: computers}) do
    %{data: render_many(computers, ComputerStore.ComputerView, "computer.json")}
  end

  def render("show.json", %{computer: computer}) do
    %{data: render_one(computer, ComputerStore.ComputerView, "computer.json")}
  end

  def render("computer.json", %{computer: computer}) do
    %{id: computer.id,
      name: computer.name,
      price: computer.price,
      cpu: computer.cpu,
      gpu: computer.gpu,
      ram: computer.ram,
      mainboard: computer.mainboard,
      drive: computer.drive}
  end
end
