defmodule ElixirEcto.Framework do
    use Ecto.Schema
    import Ecto.Changeset
    require Logger
    alias ElixirEcto.{AllowedValues}
  
    schema "frameworks" do
      field(:name, :string)
      field(:version, :string, default: "")
      field(:internal_version, :string, default: "")
      field(:version, :string)
      field(:version, :string)

      timestamps()
    end
  
    def create_changeset(struct, params \\ %{}) do
      allowed = AllowedValues.allowedFrameworks()
  
      struct
      |> cast(params, [:name, :is_active])
      |> validate_required([:name, :is_active])
      |> validate_inclusion(:esrs, allowed.esrs_identifiers)
    end
  end
  