defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

    @factor %{
      mercury: 0.2408467,
      venus: 0.61519726,
      earth: 1.0,
      mars: 1.8808158,
      jupiter: 11.862615,
      saturn: 29.447498,
      uranus: 84.016846,
      neptune: 164.79132
    }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    if(Map.has_key?(@factor, planet)) do
      years_on_earth = years_on_earth(seconds)
      factor = Map.get(@factor, planet)
      {:ok, years_on_earth / factor}
    else
      {:error, "not a planet"}
    end
  end

  defp years_on_earth(seconds), do: seconds / (60 * 60 * 24 * 365.25)
end
