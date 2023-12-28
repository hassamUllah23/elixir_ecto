import Config

config :elixir_ecto, ElixirEcto.Repo,
  database: System.fetch_env!("DB_NAME"),
  username: System.fetch_env!("DB_USER"),
  password: System.fetch_env!("DB_PASS"),
  hostname: System.fetch_env!("DB_HOST"),
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
