defmodule Main do
  require Logger
  require NimbleCSV

  alias ElixirEcto.{
    UserQueries,
    EmailQueries,
    DatapointQueries,
    User,
    Email,
    Datapoint
  }

  # import ElixirEcto.UserQueries

  # @spec insertUser(%{name: String.t(), age: number(), address: Stringy.t()}) :: no_return()
  # def insertUser(%{name: user_name, age: user_age, address: user_address}) do
  #     user = %UserStruct{name: user_name, age: user_age, address: user_address}
  #     Logger.info("User: #{user}")
  # end

  # @spec insertUser(%{name: String.t(), age: number(), address: Stringy.t()}) :: no_return()
  # def insertUser(user_name, user_age, user_address) do
  #     user = %UserStruct{name: user_name, age: user_age, address: user_address}
  #     UserQueries.create_user(user)
  #     # Logger.info("User: #{user}")
  # end

  def listUsers() do
    # Enum.each(posts, fn post ->
    #   IO.puts("Post: #{post.title}")

    #   Enum.each(post.comments, fn comment ->
    #     IO.puts("  Comment: #{comment.body}")
    #   end)

    # end)

    users = UserQueries.list_users()
    Logger.info("Inserted Users -> #{inspect(users)}")
  end

  def insertUser() do
    IO.puts("Enter name:")
    name = IO.gets("") |> String.trim()

    IO.puts("Enter Age:")
    age = IO.gets("") |> String.trim() |> String.to_integer()

    IO.puts("Enter email:")
    address = IO.gets("") |> String.trim()

    user = %User{name: name, address: address, age: age}

    Logger.info("Inserted User Details are -> #{inspect(user)}")
    # changeset = User.changeset(user)

    UserQueries.create_user(User.changeset(user))

    # case Repo.insert(changeset) do
    #   {:ok, user} -> IO.puts("User created successfully!")
    #   {:error, changeset} -> IO.puts("Error: #{changeset.errors}")
    # end
  end

  def insertEmail() do
    IO.puts("Enter Subject:")
    subject_ = IO.gets("") |> String.trim()

    IO.puts("Enter Text:")
    text_ = IO.gets("") |> String.trim()

    IO.puts("Enter Email Address:")
    address_ = IO.gets("") |> String.trim()

    email = %Email{subject: subject_, text: text_, email: address_}

    Logger.info("Inserted Email Details are -> #{inspect(email)}")
    # changeset = User.changeset(user)

    EmailQueries.create_email(Email.changeset(email))

    # case Repo.insert(changeset) do
    #   {:ok, user} -> IO.puts("User created successfully!")
    #   {:error, changeset} -> IO.puts("Error: #{changeset.errors}")
    # end
  end

  def insertDatapoint() do
    IO.puts("Enter esrs:")
    esrs_ = IO.gets("") |> String.trim()

    datapoint = %Datapoint{esrs: esrs_}

    Logger.info("Inserted Datapoint Details are -> #{inspect(datapoint)}")

    %Datapoint{}
    |> Datapoint.create_changeset(%{esrs: esrs_})
    |> DatapointQueries.create_datapoint()
  end

  def loadUsersCSV() do
    alias NimbleCSV.RFC4180, as: CSV
    data = File.read!("lib/elixir_ecto/users.csv")
    rows = CSV.parse_string(data)

    Enum.each(rows, fn [age, address, name] ->
      Logger.info("name: #{name}, age: #{age}, address: #{address}")
      # userStruct = %User{name: name, age: String.to_integer(age), address: address}
      # Logger.info("User -> #{inspect(userStruct)}")
      # UserQueries.create_user(userStruct)
    end)
  end

  def increment(num) do
    # Pattern matching assigns new value to `count`
    {num, _} = {num + 1, 0}
    num
  end

  def loadDatapointCSV() do
    if(DatapointQueries.count() == 0) do
      alias NimbleCSV.RFC4180, as: CSV
      data = File.read!("lib/elixir_ecto/E3.csv")
      rows = CSV.parse_string(data)

      # the order of these fields corresponds to the order of the columns in the csv file

      Enum.each(rows, fn [esrs, dr, paragraph, name, datatype, appendix, voluntary] ->
        # iterator = increment(iterato)
        try do
          datapoint = %{
            esrs: String.trim(esrs),
            dr: String.trim(dr),
            paragraph: String.trim(paragraph),
            name: String.trim(name),
            appendix: String.trim(appendix) |> String.downcase(),
            datatype: String.trim(datatype) |> String.downcase(),
            # the excel sheet has values "V" or "" where "V" means the datapoint is Voluntary and vice versa 
            voluntary: !(String.trim(voluntary) == "")
          }

          Logger.info("Datapoint -> #{inspect(datapoint.appendix)}")

          if datapoint.esrs == "",
            do: raise("Invalid esrs value #{inspect(datapoint.esrs)} for record number #{}")

          if datapoint.dr == "",
            do: raise("Invalid dr value #{inspect(datapoint.esrs)} for record number #{}")

          # if datapoint.appendix == "",
          #   do: raise("Invalid appendix value #{inspect(datapoint.esrs)} for record number #{}")

          if datapoint.datatype == "",
            do: raise("Invalid datatype value #{inspect(datapoint.esrs)} for record number #{}")

          DatapointQueries.create_datapoint(datapoint)
        rescue
          e in RuntimeError ->
            Logger.error("invalid value #{inspect(e)}")
            # e in RuntimeError -> e
        end
      end)
    end
  end

  def loadAllDatapointCSV() do
    if(DatapointQueries.count() == 0) do
      alias NimbleCSV.RFC4180, as: CSV
      data = File.read!("lib/elixir_ecto/data/E2.csv")
      rows = CSV.parse_string(data)

      # the order of these fields corresponds to the order of the columns in the csv file
      maps =
        Enum.map(rows, fn [esrs, dr, paragraph, name, datatype, appendix, voluntary] ->
          # iterator = increment(iterato)
          # try do
          %{
            esrs: String.trim(esrs),
            dr: String.trim(dr),
            paragraph: String.trim(paragraph),
            name: String.trim(name),
            appendix: String.trim(appendix) |> String.downcase(),
            datatype: String.trim(datatype) |> String.downcase(),
            # the excel sheet has values "V" or "" where "V" means the datapoint is Voluntary and vice versa 
            voluntary: !(String.trim(voluntary) == "")
          }
        end)

      DatapointQueries.seed(maps)
    end
  end

  def countDatapoints do
    count = DatapointQueries.count()
    Logger.info("Total DatapointS = #{count}")
  end

  def countUsers do
    count = UserQueries.count()
    Logger.info("Total Users = #{count}")
  end
end
