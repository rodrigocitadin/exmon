defmodule ExMon do
  alias ExMon.Game.Actions
  alias ExMon.Game.Status
  alias ExMon.{Player, Game}

  @computer_name "machine"

  defdelegate create_player(name), to: Player, as: :build

  def start_game(player) do
    @computer_name
    |> create_player()
    |> Game.start(player)

    Status.print_game_started()
  end

  def make_move(move) do
    move
    |> Actions.verify_move()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move(move)
  defp do_move(_any), do: raise("not implemented yet")
end
