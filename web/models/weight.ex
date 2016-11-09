defmodule FatShamer.Weight do
  use FatShamer.Web, :model

  schema "weight" do
    field :phone_number, :string
    field :weight, :integer

    timestamps
  end

  @required_fields ~w(weight phone_number)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields)
  end
end
