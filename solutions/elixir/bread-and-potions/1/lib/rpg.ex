defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defprotocol Edible do
    def eat(item, character)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(_item = %LoafOfBread{}, character = %Character{}) do
      result = Map.update!(character, :health, fn actual -> actual + 5 end)
      {nil, result}
    end
  end

  defimpl Edible, for: ManaPotion do
    def eat(potion = %ManaPotion{}, character = %Character{}) do
      result = Map.update!(character, :mana, fn actual -> actual + potion.strength end)
      {%EmptyBottle{}, result}
    end
  end

  defimpl Edible, for: Poison do
    def eat(_potion = %Poison{}, character = %Character{}) do
      result = Map.put(character, :health, 0)
      {%EmptyBottle{}, result}
    end
  end
end
