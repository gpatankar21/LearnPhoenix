defmodule LearnPhoenix.URM.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :email, :string
    field :name, :string
    field :pass, :string, virtual: true
    field :pass_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :pass])
    |> validate_required([:name, :email, :pass])
    |> validate_format(:email, ~r/@/, message: "is invalid")
    |> validate_length(:pass, min: 8, max: 100)
    |> unique_constraint(:email)
    |> put_hashed_password()
  end

  defp put_hashed_password(changeset) do
    case changeset.valid? do
    true ->
    changes = changeset.changes
    put_change(changeset, :pass_hash, hashpwsalt(changes
    .pass))
    _ ->
    changeset
  end
  end
end
