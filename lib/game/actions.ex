defmodule ExMon.Game.Actions do
  alias ExMon.Game

  @punch_pw -15..-15
  @kick_pw -20..-10
  @heal_pw 5..25

  @all_moves_values %{heal: @heal_pw, kick: @kick_pw, punch: @punch_pw}

  def move(move) do
    @all_moves_values
    |> Map.get(move)
    |> Enum.random()
    |> fetch_player_to_update()
  end

  defp fetch_player_to_update(pw) when pw > 0, do: Game.turn() |> Game.fetch_player()
  defp fetch_player_to_update(_pw), do: Game.reverse_turn() |> Game.fetch_player()

  # defp calculate_new_life(life, pw) do
  #   life
  # end
end
