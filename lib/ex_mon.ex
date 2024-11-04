defmodule ExMon do
  alias ExMon.Game.Actions
  alias ExMon.Game.Status
  alias ExMon.{Player, Game}

  @computer_name "machine"
  @moves [:kick, :punch, :heal]

  defdelegate create_player(name), to: Player, as: :build

  def start_game(player) do
    @computer_name
    |> create_player()
    |> Game.start(player)

    Status.print_game_started()
  end

  def do_move(move) do
    with {:ok, _} <- make_move(move) do
      computer_move(Game.info())
    end
  end

  defp make_move(:heal), do: {:ok, Actions.move(:heal)}
  defp make_move(:kick), do: {:ok, Actions.move(:kick)}
  defp make_move(:punch), do: {:ok, Actions.move(:punch)}
  defp make_move(move), do: {:error, Status.print_wrong_move(move)}

  defp computer_move(%{status: :continue, turn: :computer}), do: make_move(Enum.random(@moves))
  defp computer_move(_), do: :ok
end
