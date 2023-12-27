defmodule ElixirEcto.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    
    create table (:users) do
      add :name, :string
      add :age, :integer
      add :address, :string
      # add :emails, 

      timestamps()
    end

    create unique_index(:users, [:address])
  end
end
