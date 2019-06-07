defmodule LearnPhoenixWeb.ContractController do
  use LearnPhoenixWeb, :controller
  alias LearnPhoenix.CM
  import Ecto.Query
  alias LearnPhoenix.CM.Contract
  alias LearnPhoenix.Repo  
  
  def newcontract(conn,_params) do
    changeset= CM.build_contract()
    render conn, "newcontract.html", changeset: changeset
  end

  def createcontract(conn, %{"contract" => contract_params}) do
    case CM.create_contract(contract_params) do
      {:ok, contract} ->
        conn
        |> put_flash(:info, "Contract Added Successfully")
        |> redirect(to: contract_path(conn, :contractlist))
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Could Not be added")
        |> render(:newcontract, changeset: changeset)
    end
  end

  def contractlist(conn, _params) do
    contracts = Contract |> order_by(asc: :endson) |> Repo.all
    render(conn, "contractlist.html", contracts: contracts)
  end
  
  def viewcontract(conn, %{"id" => id})
   do
    contract=Repo.get(Contract, id)
    require IEx
    IEx.pry
    render(conn, "viewcontract.html", contract: contract)
  end

  def editcontract(conn, %{"id" => contract_id}) do
    contract = Repo.get(Contract,contract_id)
    contract_changeset= CM.change_contract(contract)
    render(conn, "editcontract.html", contract: contract, contract_changeset: contract_changeset)
  end

  def updatecontract(conn, %{"id" => contract_id, "contract" => contract_params}) do
    contract=Repo.get(Contract, contract_id)
    case CM.update_contract(contract, contract_params) do
      {:ok, _} ->
      conn
      |> put_flash(:info, "Contract updated successfully")
      |> redirect(to: contract_path(conn, :contractlist))
      {:error, _} ->
      conn
      |> put_flash(:info, "Error updating cart")
      |> redirect(to: contract_path(conn, :contractlist))
    end
  end

  def deletecontract(conn, %{"id" => contract_id}) do
    contract=Repo.get(Contract, contract_id)
    case Repo.delete(contract) do
      {:ok,_} ->
        conn
        |> put_flash(:info, "Contract deleted successfully")
        |> redirect(to: contract_path(conn, :contractlist))
        {:error, _} ->  
        conn
        |> put_flash(:info, "Error deleting cart")
        |> redirect(to: contract_path(conn, :contractlist)) 
    end
  end
end
