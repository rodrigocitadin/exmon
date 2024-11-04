defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_game_started do
    IO.puts("\n------- The game has started -------\n")
    IO.inspect(Game.info())
    IO.puts("\n------------------------------------\n")
  end

  def print_wrong_move(move) do
    IO.puts("\n------- Invalid move \"#{move}\" -------\n")
  end

  def print_move(player_affected, move) do
    IO.puts("\n------- #{player_affected} took a #{move} -------\n")
    IO.inspect(Game.info())
    IO.puts("\n------------------------------------\n")
  end
end
