defmodule Forall.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :name, :string
      add :email, :string
      add :comment, :text

      timestamps()
    end

  end
end
