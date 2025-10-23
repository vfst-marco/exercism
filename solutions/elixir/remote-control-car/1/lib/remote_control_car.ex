defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    RemoteControlCar.new("none")
  end

  def new(nickname) do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(remote_car = %RemoteControlCar{}) do
    {:ok, dist} = Map.fetch(remote_car, :distance_driven_in_meters)
    "#{dist} meters"
  end

  def display_battery(remote_car = %RemoteControlCar{}) do
    {:ok, bat} = Map.fetch(remote_car, :battery_percentage)

    cond do
      bat > 0 -> "Battery at #{bat}%"
      true -> "Battery empty"
    end
  end

  def drive(remote_car = %RemoteControlCar{}) do
    {:ok, bat} = Map.fetch(remote_car, :battery_percentage)

    cond do
      bat > 0 ->
        remote_car
        |> Map.update!(:battery_percentage, fn x -> x - 1 end)
        |> Map.update!(:distance_driven_in_meters, fn x -> x + 20 end)

      true ->
        remote_car
    end
  end
end
