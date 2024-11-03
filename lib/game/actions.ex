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
    |> calculate_new_life()
  end

  defp fetch_player_to_update(pw) when pw > 0 do
    player = Game.turn() |> Game.fetch_player()

    {player, pw}
  end

  defp fetch_player_to_update(pw) do
    player = Game.reverse_turn() |> Game.fetch_player()

    {player, pw}
  end

  defp calculate_new_life({player, pw}) do
    new_life = Map.get(player, :life) + pw

    case new_life do
      _ when new_life <= 0 -> Map.put(player, :life, 0)
      _ when new_life >= 100 -> Map.put(player, :life, 100)
      new_life -> Map.put(player, :life, new_life)
    end
  end
end
