defmodule Poc.Profile.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :last_name, :string
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :last_name, :email, :phone])
    |> validate_required([:name, :last_name, :email, :phone])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:name, min: 3, max: 10)
  end
end
