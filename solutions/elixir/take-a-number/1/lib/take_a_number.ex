defmodule TakeANumber do
  def start() do
    spawn(fn -> run(0) end)
  end

  defp run(state) do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        run(state)
      {:take_a_number, pid} ->
        send(pid, state + 1)
        run(state + 1)
      :stop -> nil
      _ -> run(state)
    end
  end
end
