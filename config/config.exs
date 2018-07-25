# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_forms,
  ecto_repos: [MyForms.Repo]

# Configures the endpoint
config :my_forms, MyFormsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sLIvGczWhwLKsrEFoivmpmtQgE6w0UmYIPiUndYn6uv2508mGWEp3SZWzXi4fpVW",
  render_errors: [view: MyFormsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyForms.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
