defmodule FatShamer.MessageController do
  use FatShamer.Web, :controller
  alias FatShamer.{Weight, Repo}
  import Ecto.Query

  def create(conn, %{"Body" => "last " <> limit, "From" => from} = params) do
    limit = String.to_integer(limit)

    weights = Weight
    |> where(phone_number: ^from)
    |> limit(^limit)
    |> Repo.all
    |> Enum.map(fn(weight) ->
      weight.weight
    end)
    |> Enum.join(", ")

    send_response_text(weights)

    conn
    |> put_status(201)
  end

  def create(conn, %{"Body" => body, "From" => from} = params) do
    params = %{
      phone_number: from,
      weight: body |> String.to_integer,
    }

    %Weight{}
    |> Weight.changeset(params)
    |> Repo.insert
    |> case do
      {:ok, _} ->
        send_response_text("got it. thanks!")

        conn
        |> put_status(201)
      {:error, message} ->
        conn
        |> put_status(500)
    end
  end

  def create(conn, _params) do
    send_response_text("ummmm...")

    conn
    |> put_status(201)
  end

  def send_response_text(to, message) do
    Task.async(fn ->
      ExTwilio.Message.create(%{
        body: message,
        from: System.get_env("FAT_SHAMER_NUMBER"),
        to: to
      })
    end)
  end
end
