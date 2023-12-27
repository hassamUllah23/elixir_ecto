defmodule ElixirEcto.Repo do
  use Ecto.Repo,
    otp_app: :elixir_ecto,
    adapter: Ecto.Adapters.Postgres
end
