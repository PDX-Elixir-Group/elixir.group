defmodule Elixirgroup.Repo do
  use Ecto.Repo,
    otp_app: :elixirgroup,
    adapter: Ecto.Adapters.Postgres
end
