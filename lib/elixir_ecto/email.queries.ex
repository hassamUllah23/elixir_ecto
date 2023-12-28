defmodule ElixirEcto.EmailQueries do
  import Ecto.Query
  # use ElixirEcto.Schema
  alias ElixirEcto.{Repo, Email}
  require Logger

  @doc """
  Returns the list of emails.

  ## Examples

      iex> list_emails()
      [%Email{}, ...]

  """
  def list_emails do
    query =
      from(u in Email, select: u, preload: [:emails])

    # |> with_undeleted

    Repo.all(query)
  end

  @doc """
  Creates a email.

  ## Examples

      iex> create_email(%{field: value})
      {:ok, %Email{}}

      iex> create_email(%{field: bad_value})
      {:error, ...}

  """
  def create_email(emailStruct) do
    # email = change_email(emailStruct, attrs)
    # Repo.insert(Email.changeset(emailStruct))
    Repo.insert(emailStruct)
  end

  @doc """
  Returns a data structure for tracking email changes.

  ## Examples

      iex> change_email(email)
      %Todo{...}

  """
  #   def change_email(%EmailStruct{} = email, attrs \\ %{}) do
  #     Logger.info("#{inspect(email)}")
  #     Email.changeset(email, attrs)
  #   end
end
