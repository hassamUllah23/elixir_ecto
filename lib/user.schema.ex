defmodule ElixirEcto.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirEcto.{Email}

  # @type t :: %__MODULE__{
  #         name: String.t(),
  #         age: integer,
  #         address: String.t()
  #       }
  schema "users" do
    field(:name, :string)
    field(:age, :integer, default: 18)
    field(:address, :string)
    has_many(:emails, Email, foreign_key: :user_id)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :age, :address])
    |> validate_required([:name, :age, :address])
    |> validate_length(:subject, min: 8, max: 20)
    |> validate_length(:address, min: 6, max: 30)
    |> validate_inclusion(:address, ["@", ".com"])
  end

  def update_changeset(user, params) do
    user
    |> cast(params, [:name, :age, :address])
    |> validate_required([:name, :age, :address])

    # |> validate_length(:subject, min: 8, max: 20)
    # |> validate_length(:address, min: 6, max: 30)
    # |> validate_inclusion(:address, ["@", ".com"])
  end

  def delete_changeset(id, params) do
    id
    |> cast(params, [:id])
    |> validate_required([:id])
  end

  def common_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :age, :address])
  end
end
