defmodule ElixirEcto.StandardQueries do
  import Ecto.Query
  alias ElixirEcto.{Repo, Standard}
  require Logger

  def list_standards do
    query = from(d in Standard, select: d)
    Repo.all(query)
  end

  def count do
    query = from(d in Standard, select: count())
    Repo.one(query)
  end

  # def get_standard(id) do
  #   Repo.get(Standard, id)
  # end

  def create_standard(map) do
    case Repo.insert(Standard.create_changeset(%Standard{}, map)) do
      {:ok, _inserted_data} ->
        Logger.info("Standard inserted successfully")

      {:error, error_message} ->
        Logger.error(
          "Error during insertion: #{inspect(error_message)}, \n\n Struct ---->>>>>>> #{inspect(map)}"
        )
    end
  end

  def seed() do
    Enum.each([], fn record ->
      # Assuming you have a relevant schema module and changeset function
      result = Repo.insert(Standard.create_changeset(%Standard{}, record))

      case result do
        {:ok, _inserted_data} ->
          Logger.info("Inserted data succesfully")

        {:error, changeset} ->
          Logger.error(
            "Insertion error ----->>>>> #{inspect(changeset)} \n\n RECORD -> #{inspect(record)}"
          )

          # Raise an error to trigger rollback if desired
      end
    end)
  end
end
