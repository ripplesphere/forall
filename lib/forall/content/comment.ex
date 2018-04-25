defmodule Forall.Content.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Forall.Content.Comment


  schema "comments" do
    field :comment, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:name, :email, :comment])
    |> validate_required([:name, :email, :comment])
  end
end
