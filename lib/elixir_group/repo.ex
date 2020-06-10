defmodule ElixirGroup.Repo do
  use Ecto.Repo,
    otp_app: :elixir_group,
    adapter: Ecto.Adapters.Postgres
end
