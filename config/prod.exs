use Mix.Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

# mailer_api_key =
#   System.get_env("MAILGUN_API_KEY") ||
#     raise """
#     environment variable MAILGUN_API_KEY is missing.
#     You can get one by visiting https://app.mailgun.com/app/account/security/api_keys
#     """

# mailer_domain =
#   System.get_env("MAILGUN_DOMAIN") ||
#     raise """
#     environment variable MAILGUN_API_KEY is missing.
#     You can get one by visiting https://app.mailgun.com/app/sending/domains
#     """

# access_key_id =
#   System.get_env("AWS_ACCESS_KEY_ID") ||
#     raise """
#     environment variable AWS_ACCESS_KEY_ID is missing.
#     """

# secret_access_key =
#   System.get_env("AWS_SECRET_ACCESS_KEY") ||
#     raise """
#     environment variable AWS_SECRET_ACCESS_KEY is missing.
#     """

# sentry_dsn =
#   System.get_env("SENTRY_DNS") ||
#     raise """
#     environment variable SENTRY_DNS is missing.
#     """

config :elixir_group, ElixirGroup.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :elixir_group, ElixirGroup.Endpoint,
  url: [host: "morphic.pro", scheme: "https", port: 443],
  http: [
    port: String.to_integer(System.get_env("HTTP_PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base,
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true

# config :elixir_group, ElixirGroup.Mailer,
#   adapter: Bamboo.MailgunAdapter,
#   api_key: mailer_api_key,
#   domain: mailer_domain

# config :sentry,
#   dsn: sentry_dsn,
#   environment_name: :prod,
#   enable_source_code_context: true,
#   root_source_code_path: File.cwd!,
#   tags: %{
#     env: "production"
#   },
#   included_environments: [:prod]

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.

# Do not print debug messages in production
config :logger, level: :info

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :elixir_group, ElixirGroup.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#         transport_options: [socket_opts: [:inet6]]
#       ]
#
# The `cipher_suite` is set to `:strong` to support only the
# latest and more secure SSL ciphers. This means old browsers
# and clients may not be supported. You can set it to
# `:compatible` for wider support.
#
# `:keyfile` and `:certfile` expect an absolute path to the key
# and cert in disk or a relative path inside priv, for example
# "priv/ssl/server.key". For all supported SSL configuration
# options, see https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# We also recommend setting `force_ssl` in your endpoint, ensuring
# no data is ever sent via http, always redirecting to https:
#
#     config :elixir_group, ElixirGroup.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# Finally import the config/prod.secret.exs which loads secrets
# and configuration from environment variables.

# config :ex_aws,
#   access_key_id: access_key_id,
#   secret_access_key: secret_access_key
