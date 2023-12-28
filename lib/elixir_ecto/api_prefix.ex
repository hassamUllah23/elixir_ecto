defmodule ElixirEcto.ApiPrefix do
  @prefix "/api"

  def plug(conn, _opts) do
    path = conn.path_info

    if String.starts_with?(path, @prefix) do
      new_path = String.replace_prefix(path, @prefix, "")
      {:ok, conn |> Plug.Conn.put_path_info(new_path)}
    else
      {:ok, conn}
    end
  end
end
