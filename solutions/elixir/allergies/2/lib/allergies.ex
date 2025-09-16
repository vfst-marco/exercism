defmodule Allergies do
  import Bitwise

  @allergens ~w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    Enum.filter(@allergens, & allergic_to?(flags, &1))
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    position = Enum.find_index(@allergens, & &1 == item)
    Enum.member?(@allergens, item) && (flags &&& 1 <<< position) !== 0
  end
end
