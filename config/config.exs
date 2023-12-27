import Config

config :elixir_ecto,
  ecto_repos: [ElixirEcto.Repo]

import_config "#{Mix.env()}.exs"
