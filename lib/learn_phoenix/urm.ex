defmodule LearnPhoenix.URM do
  alias LearnPhoenix.URM.User
  alias LearnPhoenix.Repo

  def build_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
  end

  def create_user(attrs) do
    attrs
    |> build_user
    |> Repo.insert
  end

  def get_user_by_email(email), do: Repo.get_by(User, email: email)

  def get_user_by_credentials(%{"email" => email, "password" => pass}) do
    user = get_user_by_email(email)

    cond do
      user && Comeonin.Bcrypt.checkpw(pass, user
      .pass_hash) ->
        user
      true ->
        :error
    end
  end
  def get_user(id), do: Repo.get(User, id)
end
