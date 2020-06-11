defmodule ElixirgroupWeb.Routers.SubdomainRouter do
  use ElixirgroupWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ElixirgroupWeb.LayoutView, :subdomain}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ElixirgroupWeb do
    pipe_through :browser
  
    live "/", SubPageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Subdomainer do
  #   pipe_through :api
  # end
end



