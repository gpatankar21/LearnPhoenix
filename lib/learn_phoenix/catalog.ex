defmodule Catalog do
  alias NimbleCSV.RFC4180, as: CSV
  def list_products() do
    "priv/product_list.csv"
    |> File.read!
    |> CSV.parse_string
    |> Enum.map(fn [id,name,price] -> %Catalog.Product{id: id,name: name,price: price}
                end)
  end
  def print_number(lst) do
    lst |> Enum.random()
  end
end
