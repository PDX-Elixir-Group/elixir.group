defmodule ElixirgroupWeb.SubPageLive do
  use ElixirgroupWeb, :live_view
  alias Elixirgroup.Accounts
  @impl true
  def mount(params, session, socket) do
    [subdomain|[]] = Regex.run(~r/^[\w|-]*/, socket.host_uri.host)
    group = Accounts.get_group_by_subdomain!(subdomain)
    {:ok, assign(socket, query: "", results: %{}, group: group)}
  end


end
