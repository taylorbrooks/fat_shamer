defmodule FatShamer.Repo.Migrations.CreateWeight do
  use Ecto.Migration

  def change do
    create table :weight do
      add :weight, :integer
      add :phone_number, :string

      timestamps
    end

  end
end
