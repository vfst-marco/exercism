defmodule BoutiqueInventory do

  @enforce_keys [:name, :price, :quantity_by_size]
  defstruct [:name, :price, :quantity_by_size]

  @type item :: %__MODULE__{
    name: String.t(),
    price: integer(),
    quantity_by_size: %{atom() => integer()}
  }

  @spec sort_by_price(list(item())) :: list(item())
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(& &1.price)
  end

  @spec sort_by_price(list(item())) :: list(item())
  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(& &1.price == nil)
  end

  @spec sort_by_price(list(item())) :: list(item())
  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn item ->
      Map.update!(item, :name, &(String.replace(&1, old_word, new_word)))
    end)
  end

  @spec sort_by_price(list(item())) :: list(item())
  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn qty_map ->
      Enum.into(qty_map, %{}, fn {size, qty} -> {size, qty + count} end)
    end)
  end

  @spec sort_by_price(list(item())) :: integer()
  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_size, qty}, acc -> acc + qty end)
  end
end
