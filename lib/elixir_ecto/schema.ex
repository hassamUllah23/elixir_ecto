# Define a module to be used as base
defmodule ElixirEcto.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      # @primary_key {:id, :binary_id, autogenerate: true}
      # @foreign_key_type :binary_id
      # @timestamps_opts [type: :utc_datetime]
    end
  end
end
