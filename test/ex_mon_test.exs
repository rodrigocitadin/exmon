defmodule ExMonTest do
  use ExUnit.Case

  alias ExMon.Player

  describe "create_player/1" do
    test "create player with given name" do
      player = ExMon.create_player("test_player")

      assert %ExMon.Player{life: 100, moves: [:heal, :punch, :kick], name: "test_player"} ===
               player
    end
  end

  describe "start_game/1" do
    setup do
      player = Player.build("test_player")

      [player: player]
    end

    test "start game with given player", context do
      assert :ok = ExMon.start_game(context[:player])
    end
  end

  describe "do_move/1" do
    setup do
      player = Player.build("test_player")
      ExMon.start_game(player)

      :ok
    end

    test "do a valid move" do
      result = ExMon.do_move(:kick)

      assert {:ok, :ok} === result
    end

    test "do a invalid move" do
      result = ExMon.do_move(:amor)

      assert :ok === result
    end
  end
end
