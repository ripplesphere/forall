# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :forall,
  ecto_repos: [Forall.Repo]

# Configures the endpoint
config :forall, ForallWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "izahbJ9m2bFdFFU0Bffy9xkJUZoLUdfAXN8H9JUmwB7XRY3avcEQTXc5Hosux1SL",
  render_errors: [view: ForallWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Forall.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
