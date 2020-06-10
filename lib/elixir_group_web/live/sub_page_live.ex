defmodule ElixirGroupWeb.SubPageLive do
  use ElixirGroupWeb, :live_view
  alias ElixirGroup.Accounts
  @impl true
  def mount(params, session, socket) do
    [subdomain|[]] = Regex.run(~r/^[\w|-]*/, socket.host_uri.host)
    group = Accounts.get_group_by_subdomain!(subdomain)
    {:ok, assign(socket, query: "", results: %{}, group: group)}
  end


end
