ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ComputerStore.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ComputerStore.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ComputerStore.Repo)

