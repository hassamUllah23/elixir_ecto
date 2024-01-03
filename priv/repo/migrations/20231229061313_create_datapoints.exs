defmodule ElixirEcto.Repo.Migrations.CreateDatapoints do
  use Ecto.Migration

  require DatapointStruct
  def change do
    create table (:datapoints) do
      add :esrs, :string
      add(:dr, :string)
      add(:paragraph, :string)
      add(:name, :string, size: 2000)
      add(:datatype, :string)
      add(:appendix, :string, default: "")
      add(:voluntary, :boolean)

      timestamps()
    end
  end
end
