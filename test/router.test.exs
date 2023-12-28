defmodule ElixirEcto.RouterTest do
  use ExUnit.Case, async: true

  use Plug.Test

  alias ElixirEcto.Router

  @opts Router.init([])

  test "establish_connection" do
    build_conn = conn(:get, "/")
    conn = Router.call(build_conn, @opts)

    assert conn.status == 200
    assert conn.state == :sent
    assert conn.resp_body == "OK"
  end

  test "solo" do
    build_conn = conn(:get, "/solo")
    conn = Router.call(build_conn, @opts)
    assert conn.status == 200
    assert conn.state == :sent
    assert conn.resp_body == "Han Solo"
  end
end
