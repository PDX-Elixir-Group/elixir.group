defmodule ElixirGroupWeb.Routers.SubdomainRouter do
  use ElixirGroupWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ElixirGroupWeb.LayoutView, :subdomain}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ElixirGroupWeb do
    pipe_through :browser
  
    live "/", SubPageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Subdomainer do
  #   pipe_through :api
  # end
end



