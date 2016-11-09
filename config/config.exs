# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fat_shamer,
  ecto_repos: [FatShamer.Repo]

# Configures the endpoint
config :fat_shamer, FatShamer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "15I/0HgV+eYWdYbTlL2Qb/Myv47TWcY1cFeg3xPtnZBU5e38pXZ0iWcaol4TKAzB",
  render_errors: [view: FatShamer.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FatShamer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
