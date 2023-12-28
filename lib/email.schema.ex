defmodule ElixirEcto.Email do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirEcto.{User}

  schema "emails" do
    field(:subject, :string)
    field(:text, :string)
    field(:email, :string)
    belongs_to(:users, User)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:subject, :text, :email])
    |> validate_required([:subject, :text])
    |> validate_length(:subject, min: 8, max: 20)
    |> validate_length(:text, min: 10, max: 50)
    |> validate_inclusion(:text, ["hello"])
    |> validate_length(:email, min: 6, max: 30)
    |> validate_inclusion(:email, ["@", ".com"])
  end
end
