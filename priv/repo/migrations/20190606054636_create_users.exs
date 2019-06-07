defmodule LearnPhoenix.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext" 1
    create table(:users) do
      add :name, :string
      add :email, :citext
      add :pass_hash, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
