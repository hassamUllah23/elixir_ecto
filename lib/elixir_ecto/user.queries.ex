defmodule ElixirEcto.UserQueries do
  import Ecto.Query
  alias ElixirEcto.{Repo, User, UserStruct}
  require Logger

  def list_users do
    query = from(u in User, select: u)
    Repo.all(query)
  end

  def count do
    query = from(u in User, select: count())
    Repo.one(query)
  end

  def get_user(id) do
    # query = from(u in User, select: u, where: u.id == id)
    # users = Repo.(query)
    # users = Repo.all(from u in User, select: u)
    # Logger.info("#{inspect(users)}")
    Repo.get(User, id)
  end

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
    oldRecord = Repo.get_by(User, id: id)
    Repo.delete(User.delete_changeset(oldRecord, %{}))
  end

  def change_user(%UserStruct{} = user, attrs \\ %{}) do
    Logger.info("#{inspect(user)}")
    User.changeset(user, attrs)
  end
end
