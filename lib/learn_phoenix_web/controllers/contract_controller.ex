defmodule LearnPhoenixWeb.ContractController do
  use LearnPhoenixWeb, :controller
  alias LearnPhoenix.CM

  def newcontract(conn,_params) do
    changeset= CM.build_contract()
    render conn, "newcontract.html", changeset: changeset
  end

  def createcontract(conn, %{"contract" => contract_params}) do
    case CM.create_contract(contract_params) do
      {:ok, contract} ->
        conn
        |> put_flash(:info, "Contract Added Successfully")
        |> redirect(to: page_path(conn, :contractlist))
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Could Not be added")
        |> render(:newcontract, changeset: changeset)
    end
  end
end
