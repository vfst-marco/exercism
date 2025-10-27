# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start() do
    Agent.start(fn -> {0, []} end)
  end

  def list_registrations(pid) do
    Agent.get(
      pid,
      fn {_, list} -> list end
    )
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {id, list} ->
      new_plot = %Plot{plot_id: id + 1, registered_to: register_to}
      {new_plot, {id + 1, [new_plot | list]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.cast(pid, fn {id, list} ->
      {id, Enum.filter(list, fn plot -> Map.fetch!(plot, :plot_id) != plot_id end)}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {_, list} ->
      Enum.find(list, {:not_found, "plot is unregistered"}, fn plot ->
        Map.fetch!(plot, :plot_id) == plot_id
      end)
    end)
  end
end
