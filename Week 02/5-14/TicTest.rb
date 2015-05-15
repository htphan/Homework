require 'minitest/autorun'
require './tic-tac-toe'
require './cpu'
require './player'
require './board'




class CpuTest < MiniTest::Test
  def test_cpu_has_piece
    cpu = Cpu.new("X")
    assert cpu.current_piece == "X"
  end

  def test_cpu_guess
    cpu = Cpu.new("X")
    available = (1..9).to_a
    guess = cpu.select_placement(available)
    assert available.include?(guess.to_i)
  end
end

class PlayerTest < MiniTest::Test
  def test_player_has_piece
    player = Player.new("X")
    assert player.current_piece == "X"
  end

  def test_player_can_guess
    player = Player.new("X")
    available = (1..9).to_a
    guess = player.select_placement(available)
    assert available.include?(guess.to_i)
  end
end

class BoardTest < MiniTest::Test
  def test_can_make_board
    board = Board.new
    assert_instance_of Board, board
  end

  def test_can_show_board
    board = Board.new
    show_board = board.show_board
    assert_instance_of NilClass, show_board
  end
end

class TicTacToeTest < MiniTest::Test
  def test_can_start_game
    test_game = TicTacToe.new
    assert_instance_of TicTacToe, test_game
  end

  def test_can_get_playing_mode
    test_game = TicTacToe.new
    p_mode = test_game.playing_mode
    assert [1,2,3].include?(p_mode.to_i)
  end

  def test_can_complete_game
    test_game = TicTacToe.new
    p_mode = test_game.playing_mode
    start = test_game.start
    assert_instance_of NilClass, start
  end
end
