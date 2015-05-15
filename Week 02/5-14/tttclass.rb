require 'pry'
require './board'
require './player'
require './cpu'

class TicTacToe

  WIN_COMBOS = [[0,1,2], [3,4,5], [6,7,8],
                [0,3,6], [1,4,7], [2,5,8],
                [6,4,2], [0,4,8]]

  def initialize
    # @score = [] implement the score it another file
    @chosen_blocks = []
    @board = Board.new
    @current_player = nil
    @player1 = nil
    @player2 = nil

  end

  def playing_mode
    puts "Let's play Tic Tac Toe!"
    puts "**Playing Modes**"
    puts "1: Player1 vs CPU"
    puts "2: Player1 vs Player2"
    puts "3: CPU vs CPU"
    puts "Please select your playing mode (1, 2, or 3):"
    p_mode = gets.chomp
    until p_mode =~ /^[1-3]$/
      puts "Your input was not recognized."
      puts "Please select 1, 2, or 3:"
      p_mode = gets.chomp
    end
    if p_mode == "1"
      @piece1 = choose_piece
      @player1 = Player.new(@piece1)
      avail_piece = ["X", "O"].reject { |x| x == @piece1}
      @player2 = Cpu.new(avail_piece[0])
    elsif p_mode == "2"
      @piece1 = choose_piece
      @player1 = Player.new(@piece1)
      avail_piece = ["X", "O"].reject { |x| x == @piece1}
      @player2 = Player.new(avail_piece[0])
    else
      @piece1 = "X"
      @player1 = Cpu.new(@piece1)
      @player2 = Cpu.new("O")
    end 
    p_mode  
  end

  def start
    random_player = [@player1, @player2].sample
    @current_player = random_player
    puts "Welcome to Multiplayer Mode!"
    puts "To choose your placements, input the corresponding"\
      "\nnumber with your desired placement!"\
      "\n(ex: 1 for the top left corner)"
    until complete?
      @board.show_board     
      puts "It's #{@current_player.current_piece}'s turn!"
      @move = choose_move(@current_player)
      replace_board
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
    @board.show_board 
    if win? 
      win_msg = find_winner == "X" ? "'X' is the Winner!" : "'O' is the Winner!"
      puts win_msg
    else
      puts "It's a draw!"
    end
  end

  def win?
    WIN_COMBOS.any? { |x, y, z|
      @board.current_board[x] == @board.current_board[y] && @board.current_board[y] == @board.current_board[z]
    }
  end

  def find_winner
    index = WIN_COMBOS.find_index { |x, y, z|
      @board.current_board[x] == @board.current_board[y] && @board.current_board[y] == @board.current_board[z]
    }
    @board.current_board[WIN_COMBOS[index][0]]
  end

  def draw?
    @board.current_board.all? { |x| x.is_a? String }
  end

  def complete?
    win? || draw?
  end

  def replace_board
    @board.replace_block(@move, @current_player.current_piece)
  end

  def choose_move(player)
    @available = @board.available_blocks
    @move = player.select_placement
    until @available.include?(@move+1)
      puts "Your input was not recognized, please try again:"
      @move = player.select_placement
    end
    @move
  end

  def choose_piece
    puts "Player 1: What piece would you like to be? (X or O)"
    @piece1 = gets.chomp.upcase 
    until @piece1 =~ /^[xo]$/i
      puts "Your input was not recognized."
      puts "Please select 'X' or 'O':" 
      @piece1 = gets.chomp.upcase
    end
    @piece1
  end
end

