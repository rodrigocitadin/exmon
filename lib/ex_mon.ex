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

  def make_move(:heal), do: Actions.move(:heal)
  def make_move(:kick), do: Actions.move(:kick)
  def make_move(:punch), do: Actions.move(:punch)
  def make_move(move), do: Status.print_wrong_move(move)
end
