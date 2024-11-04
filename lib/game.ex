defmodule ExMon.Game do
  use Agent

  def start(computer, player) do
    initial_value = %{
      computer: computer,
      player: player,
      turn: :player,
      status: :started,
      round: 0
    }

    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def update(state) do
    Agent.update(__MODULE__, fn _ -> state end)
  end

  def info, do: Agent.get(__MODULE__, & &1)

  def fetch_player(:player), do: Map.get(info(), :player)
  def fetch_player(:computer), do: Map.get(info(), :computer)
  def round, do: Map.get(info(), :round)
  def turn, do: Map.get(info(), :turn)

  def reverse_turn do
    case turn() do
      :player -> :computer
      :computer -> :player
    end
  end
end
