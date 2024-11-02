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
    case move do
      :heal -> Actions.move(:heal)
      :kick -> Actions.move(:kick)
      :punch -> Actions.move(:punch)
      move -> Status.print_wrong_move(move)
    end
  end
end
