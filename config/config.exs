# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixirgroup,
  ecto_repos: [Elixirgroup.Repo]

# Configures the endpoint
config :elixirgroup, ElixirgroupWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GAO3OPjUze3EApr5OhZtbNfyOVl9OPoZLEZaJYzPkGREcjtb5jRTjzMGxN+DNFfO",
  render_errors: [view: ElixirgroupWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Elixirgroup.PubSub,
  live_view: [signing_salt: "kLQ2sF+6"],
  check_origin: {Elixirgroup.Origin, :check_origin, []}

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
