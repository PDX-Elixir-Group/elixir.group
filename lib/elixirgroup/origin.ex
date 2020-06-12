defmodule Elixirgroup.Origin do
  @spec check_origin(URI.t()) :: boolean
  def check_origin(%URI{} = origin) do
    # Check origin (query db etc), return true/ false
    # origin.authority in ["a.app.com", "b.app.com"]
    IO.puts("------")
    IO.inspect(origin)
    IO.puts("------")
    
    true
  end
end