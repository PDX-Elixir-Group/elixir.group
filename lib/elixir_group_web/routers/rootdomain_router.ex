defmodule ElixirGroupWeb.Routers.RootdomainRouter do
  use ElixirGroupWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ElixirGroupWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirGroupWeb do
    pipe_through :browser

    live "/groups", GroupLive.Index, :index
    live "/groups/new", GroupLive.Index, :new
    live "/groups/:id/edit", GroupLive.Index, :edit

    live "/groups/:id", GroupLive.Show, :show
    live "/groups/:id/show/edit", GroupLive.Show, :edit

    # live "/users", UserLive.Index, :index
    # live "/users/new", UserLive.Index, :new
    # live "/users/:id/edit", UserLive.Index, :edit

    # live "/users/:id", UserLive.Show, :show
    # live "/users/:id/show/edit", UserLive.Show, :edit


    live "/", PageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirGroupWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ElixirGroupWeb.Telemetry
    end
  end
end
