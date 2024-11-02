defmodule ExMon do
  alias ExMon.{Player, Game}

  @computer_name "machine"

  defdelegate create_player(name), to: Player, as: :build

  def start_game(player) do
    @computer_name
    |> create_player()
    |> Game.start(player)
  end
end
