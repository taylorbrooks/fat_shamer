defmodule FatShamer.MessageController do
  use FatShamer.Web, :controller
  alias FatShamer.{Weight, Repo}
  import Ecto.Query

  def create(conn, %{"Body" => "last " <> limit, "From" => from}) do
    limit = String.to_integer(limit)

    weights = Weight
    |> where(phone_number: ^from)
    |> limit(^limit)
    |> Repo.all
    |> Enum.map(fn(weight) ->
      weight.weight
    end)
    |> Enum.join(", ")


    # pull out from, number
    # Query DB for last <number> where from == from
    # respond with list to string
    # format for TwiML maybe
    conn
    |> put_status(201)
    |> json(weights)
  end

  def create(conn, %{"Body" => body, "From" => from}) do
    params = %{
      phone_number: from,
      weight: body |> String.to_integer,
    }

    %Weight{}
    |> Weight.changeset(params)
    |> Repo.insert
    |> case do
      {:ok, _} ->
        conn
        |> put_status(201)
        |> json("hi")
      {:error, message} ->
        conn
        |> put_status(500)
        |> json("da fuk?")
    end
  end

  def create(conn, _params) do
    conn
    |> put_status(201)
    |> json("hi")
  end
end
