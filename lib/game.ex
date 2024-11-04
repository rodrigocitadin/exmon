defmodule ExMon.Game do
  alias ExMon.Game.Status
  alias ExMon.Player
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
    Agent.update(__MODULE__, fn _ -> update_game_status(state) end)
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

  defp update_game_status(
         %{player: %Player{life: player_life}, computer: %Player{life: computer_life}} = state
       )
       when player_life === 0 or computer_life === 0 do
    new_state = Map.put(state, :status, :game_over)
    Status.print_game_over(new_state)

    new_state
  end

  defp update_game_status(state) do
    state
    |> Map.put(:status, :continue)
    |> update_turn()
    |> update_round()
  end

  defp update_turn(%{turn: :player} = state), do: Map.put(state, :turn, :computer)
  defp update_turn(state), do: Map.put(state, :turn, :player)

  defp update_round(%{round: round} = state), do: Map.put(state, :round, round + 1)
end
