defmodule ElixirEcto.Standard do
  use Ecto.Schema
  import Ecto.Changeset
  require Logger
  alias ElixirEcto.{AllowedValues}

  schema "standards" do
    field(:name, :string)
    field(:is_active, :boolean)
    belongs_to(:frameworks, Framework) 
    timestamps()
  end

  def create_changeset(struct, params \\ %{}) do
    allowed = AllowedValues.allowedStandards()

    struct
    |> cast(params, [:name, :is_active])
    |> validate_required([:name, :is_active])
    |> validate_inclusion(:esrs, allowed.esrs_identifiers)
  end
end
