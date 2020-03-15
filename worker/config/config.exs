# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :worker, WorkerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "x3F39cXHi3JtRYxkCCHqOJMiD7zggzUeY1CPi/5JOigTAQBEaZvvBukMBv5+eYzh",
  render_errors: [view: WorkerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Worker.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "kTAyN7F9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
