defmodule ElixirEcto.Datapoint do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirEcto.{AllowedValues}
  require Logger

  schema "datapoints" do
    field(:esrs, :string)
    field(:dr, :string)
    field(:paragraph, :string)
    field(:name, :string)
    field(:datatype, :string)
    field(:appendix, :string)
    field(:voluntary, :boolean)

    timestamps()
  end

  def create_changeset(struct, params \\ %{}) do
    allowed = AllowedValues.allowedDatapointValues()

    struct
    |> cast(params, [:esrs, :dr, :paragraph, :name, :datatype, :appendix, :voluntary])
    |> validate_required([:esrs, :dr, :paragraph, :name, :datatype, :voluntary])
    |> validate_inclusion(:esrs, allowed.esrs_identifiers)
    |> validate_inclusion(:dr, allowed.drs)
    |> validate_inclusion(:datatype, allowed.datatypes)
    |> validate_inclusion(:appendix, allowed.appendices)
  end
end
