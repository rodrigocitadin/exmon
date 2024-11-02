defmodule ExMon.Game.Actions do
  @punch_pw -15..-15
  @kick_pw -20..-10
  @heal_pw 5..25

  @all_moves_values %{heal: @heal_pw, kick: @kick_pw, punch: @punch_pw}

  def move(move) do
    @all_moves_values
    |> Map.get(move)
    |> Enum.random()
    |> calculate_life()
  end

  defp calculate_life(pw) do
    IO.puts(pw)
  end
end
