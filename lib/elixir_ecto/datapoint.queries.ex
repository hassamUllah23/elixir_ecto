defmodule ElixirEcto.DatapointQueries do
  import Ecto.Query
  alias ElixirEcto.{Repo, Datapoint}
  require Logger

  def list_datapoints do
    query = from(d in Datapoint, select: d)
    Repo.all(query)
  end

  def count do
    query = from(d in Datapoint, select: count())
    Repo.one(query)
  end

  def get_datapoint(id) do
    Repo.get(Datapoint, id)
  end

  def create_datapoint(map) do
    case Repo.insert(Datapoint.create_changeset(%Datapoint{}, map)) do
      {:ok, _inserted_data} ->
        Logger.info("Datapoint inserted successfully")

      {:error, error_message} ->
        Logger.error(
          "Error during insertion: #{inspect(error_message)}, \n\n Struct ---->>>>>>> #{inspect(map)}"
        )
    end
  end

  def seed(maps) do
    case Repo.transaction(fn ->
           Enum.each(maps, fn record ->
             # Assuming you have a relevant schema module and changeset function
             result = Repo.insert(Datapoint.create_changeset(%Datapoint{}, record))

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
         end) do
      {:ok, _results} ->
        IO.puts("All data inserted successfully!")

      {:error, error} ->
        IO.puts("Transaction failed: #{inspect(error)}")
    end
  end
end
