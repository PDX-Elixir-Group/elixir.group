defmodule Elixirgroup.Origin do
  import Ecto.Query, only: [from: 2]

  @spec check_origin(URI.t()) :: boolean
  def check_origin(%URI{} = origin) do
    case origin.authority do
      "elixir.group" -> true
      _ ->
        [subdomain|[]] = Regex.run(~r/^[\w|-]*/, origin.authority)
        (from g in Elixirgroup.Accounts.Group, where: g.subdomain == ^subdomain) |> Elixirgroup.Repo.exists?
    end
  end
end