defmodule ElixirEcto.UserQueries do
  import Ecto.Query
  import ElixirEcto.User
  alias ElixirEcto.{Repo, User, UserStruct}
  require Logger

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    query = from(u in User, select: u)

    # |> with_undeleted

    users = Repo.all(query)
    # users = Repo.all(from u in User, select: u)
    # Logger.info("#{inspect(users)}")
    users
  end

  def get_user(id) do
    # query = from(u in User, select: u, where: u.id == id)

    # |> with_undeleted

    # users = Repo.(query)
    # users = Repo.all(from u in User, select: u)
    # Logger.info("#{inspect(users)}")
    Repo.get(User, id)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, ...}

  """
  def create_user(userStruct) do
    # user = change_user(userStruct, attrs)
    # Repo.insert(User.changeset(userStruct))
    Repo.insert(userStruct)
  end

  def update_user(id, data) do
    oldRecord = Repo.get_by(User, id: id)
    Logger.info("OLD RECORD FOUND ----------- #{inspect(oldRecord)}")
    Repo.update(User.common_changeset(oldRecord, data))
  end

  def delete_user(id) do
    # user = change_user(userStruct, attrs)
    # Repo.insert(User.changeset(userStruct))
    oldRecord = Repo.get_by(User, id: id)
    Repo.delete(User.delete_changeset(oldRecord, %{}))
    # Repo.delete(userStruct)
  end

  @doc """
  Returns a data structure for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Todo{...}

  """
  def change_user(%UserStruct{} = user, attrs \\ %{}) do
    Logger.info("#{inspect(user)}")
    User.changeset(user, attrs)
  end
end
