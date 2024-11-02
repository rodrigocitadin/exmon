defmodule ExMon.Game.Actions do
  def verify_move(:kick), do: raise("not implemented yet")
  def verify_move(:punch), do: raise("not implemented yet")
  def verify_move(:heal), do: raise("not implemented yet")
  def verify_move(invalid_move), do: {:error, invalid_move}
end
