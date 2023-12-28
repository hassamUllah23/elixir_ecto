defmodule ElixirEcto.Router do
  require Logger
  #   import Elixir
  import ElixirEcto.ResponseMessages
  import ElixirEcto.UserQueries
  require ElixirEcto.UserQueries
  alias ElixirEcto.{UserStruct, UserQueries, User}
  use Plug.Router
  use Plug.ErrorHandler
  #   import ElixirEcto.ApiPrefix

  #   plug ElixirEcto.ApiPrefix
  plug(Plug.Logger)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  # default endpoint for checking connection
  get("/", do: send_resp(conn, 200, "OK"))

  # common endpoints
  get("/solo", do: send_resp(conn, 200, "Han Solo"))

  # common endpoints
  create = "create"
  list = "list"
  getOne = "get"
  update = "update"
  delete = "delete"

  # users module
  users = "users"

  post "/#{users}/#{create}" do
    Logger.info("Request Body -> #{inspect(conn.body_params)}")

    user = %User{
      name: conn.body_params["name"],
      age: conn.body_params["age"],
      address: conn.body_params["address"]
    }

    Logger.info("Name: #{inspect(user.name)}")
    UserQueries.create_user(user)
    send_resp(conn, 200, createSuccessRespose("User"))
  end

  get "/#{users}/#{list}" do
    users =
      UserQueries.list_users()
      |> Enum.map(fn user -> Map.drop(user, [:__meta__, :__struct__, :emails]) end)

    Logger.info("#{inspect(users)}")
    {:ok, json} = Jason.encode(users)
    send_resp(conn, 200, json)
  end

  get "/#{users}/#{getOne}/:id" do
    %{"id" => user_id} = conn.params
    id = String.to_integer(user_id)

    user = UserQueries.get_user(id)
    stripped = Map.drop(user, [:__meta__, :__struct__, :emails])
    Logger.info("#{inspect(user)}")
    {:ok, json} = Jason.encode(user)
    send_resp(conn, 200, json)
  end

  patch "/#{users}/#{update}/:id" do
      %{"id" => user_id} = conn.params
      # id = String.to_integer(user_id)

    data = %{
      id: String.to_integer(user_id),
      name: conn.body_params["name"],
      age: conn.body_params["age"],
      address: conn.body_params["address"]
    }

    Logger.info("ID RECEIVED -> #{id} ------ DATA RECEIVED -> #{inspect(data)}")
    UserQueries.update_user(id, data)
    send_resp(conn, 200, updateSuccessRespose("User"))
  end

  delete "/#{users}/#{delete}/:id" do
    %{"id" => user_id} = conn.params
    Logger.info("Received ID: #{user_id}")
    id = String.to_integer(user_id)

    # user = %User{
    #   id: String.to_integer(user_id)
    # }

    # id = String.to_integer(user_id)
    UserQueries.delete_user(id)
    send_resp(conn, 200, deleteSuccessRespose("User"))
  end

  # error fallback
  # this must be at the last
  match(_, do: send_resp(conn, 404, "Not Found"))

  # any wrong http request will invoke this response
  defp handle_errors(conn, %{kind: kind, reason: reason, stack: _stack}) do
    Logger.error("#{inspect(kind)} ------- #{inspect(reason)}")
    send_resp(conn, conn.status, "Something went wrong")
  end
end
