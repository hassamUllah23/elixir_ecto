defmodule ElixirEcto.UserQueries do
  import Ecto.Query
  # use ElixirEcto.Schema
  alias ElixirEcto.{Repo, User, UserStruct}
  require Logger

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    query =
      from(u in User, select: u, preload: [:emails])

    # |> with_undeleted

    Repo.all(query)
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
