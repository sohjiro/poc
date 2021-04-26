# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :poc,
  ecto_repos: [Poc.Repo]

# Configures the endpoint
config :poc, PocWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BbH3/Iti2dQxWssVuxGAe3uQD4UCs8tluAGDu4W2HevHjulsTVPOY7vD6e1OaNmr",
  render_errors: [view: PocWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Poc.PubSub,
  live_view: [signing_salt: "983GWaiH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
