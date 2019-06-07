defmodule LearnPhoenixWeb.RegistrationController do
  use LearnPhoenixWeb, :controller
  alias LearnPhoenix.URM
  def new(conn, _)do
    changeset=URM.build_user()
    render conn, "new.html", changeset: changeset
  end
  def create(conn, %{"registration" => registration_params}) do
    case URM.create_user(registration_params) do
      {:ok, user} ->
      conn
      |> put_flash(:info, "Registration successful")
      |> redirect(to: contract_path(conn, :contractlist))
      {:error, changeset} ->
      conn
      |> render(:new, changeset: changeset)
    end
  end
end
