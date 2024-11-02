defmodule ExMon.Player do
  @player_attributes [:life, :moves, :name]
  @max_life 100

  @enforce_keys @player_attributes
  defstruct @player_attributes

  def build(name) do
    %__MODULE__{
      life: @max_life,
      moves: [:heal, :punch, :kick],
      name: name
    }
  end
end
