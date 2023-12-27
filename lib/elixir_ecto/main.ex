defmodule Main do
  require Logger
  alias ElixirEcto.{UserQueries, EmailQueries, User, Email}
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
end
