defmodule ElixirEcto.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do

    create table (:emails) do
      add :email, :string
      add :subject, :string
      add :text, :string
      # add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:emails, [:email])
  end
end
