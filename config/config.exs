# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_group,
  ecto_repos: [ElixirGroup.Repo]

# Configures the endpoint
config :elixir_group, ElixirGroupWeb.Endpoint,
  secret_key_base: "2rZxFq68sv3p0hShu4ZNJv8LaEcdHqWnEMa4dtou2dwC7VlSn05prRPstJXBeA1q",
  render_errors: [view: ElixirGroupWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirGroup.PubSub,
  live_view: [signing_salt: "hY6F8oj6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
