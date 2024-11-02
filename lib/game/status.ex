defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_game_started_message do
    IO.puts("\n------- The game has started -------\n")
    IO.inspect(Game.info())
    IO.puts("\n------------------------------------\n")
  end
end
