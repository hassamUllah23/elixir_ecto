defmodule ElixirEcto.Repo.Migrations.CreateStandards do
  use Ecto.Migration

  def change do
    create table (:standards) do
      add(:name, :string)
      add(:is_active, :boolean)
      belongs_to(:frameworks, Framework) 
      timestamps()
    end
  end
end
