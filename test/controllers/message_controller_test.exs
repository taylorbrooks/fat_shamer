defmodule FatShamer.MessageControllerTest do
  use FatShamer.ConnCase
  alias FatShamer.Fixture

  test "weight [num]e", %{conn: conn} do
    conn = post conn, "/message", Fixture.weight_hook
    assert json_response(conn, 201)
  end

  test "last [num]", %{conn: conn} do
    post conn, "/message", Fixture.weight_hook
    post conn, "/message", %{Fixture.weight_hook | "Body" => "176"}

    conn = post conn, "/message", %{Fixture.weight_hook | "Body" => "last 2"}
    assert conn.resp_body, "175, 176"
  end

end
