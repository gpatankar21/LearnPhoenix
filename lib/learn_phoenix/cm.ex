defmodule LearnPhoenix.CM do
  alias LearnPhoenix.CM.Contract
  alias LearnPhoenix.Repo

  def build_contract(attrs \\ %{})do
    %Contract{}
    |> Contract.changeset(attrs)
  end

  def create_contract(attrs) do
    attrs
    |> build_contract
    |> Repo.insert
  end
end
