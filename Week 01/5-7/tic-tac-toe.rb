# Tic-Tac-Toe Game

## ASCII for the Tic-Tac-Toe Board:
##
##        |       |       
##    1   |   2   |   3    
## _______|_______|_______
##        |       |
##    4   |   5   |   6
## _______|_______|_______
##        |       |
##    7   |   8   |   9
##        |       |

## Playing Mode:
## Player vs Player, Player vs CPU

## Difficulty:
## Normal, Hard, Death

require 'pry'
require 'set'

WIN_COMBOS = [[0,1,2], [3,4,5], [6,7,8],
                [0,3,6], [1,4,7], [2,5,8],
                [6,4,2], [0,4,8]]

def start
  puts "Let's play Tic-Tac-Toe!"
  p = player_selection
  p == "1" ? difficulty_mode : multiplayer_start
end

def multiplayer_start
  placement = (1..9).to_a
  peices = ["X", "O"]
  puts "Welcome to Multiplayer Mode!"
  select_letter
  player = peices.sample
  puts "To choose your placements, input the corresponding"\
    "\nnumber with your desired placement!"\
    "\n(ex: 1 for the top left corner)"
  until complete?(placement)
    print_board(placement)     
    puts "It's #{player}'s turn!"
    move = p_move(placement)
    placement[move] = player
    player = player == "X" ? "O" : "X"
  end
  print_board(placement)  
  if win?(placement)
    win_msg = find_winner(placement) == "X" ? "'X' is the Winner!" : "'O' is the Winner!"
    puts win_msg
  else
    puts "It's a draw!"
  end
  play_again?
end

def win?(placement)
  WIN_COMBOS.any? { |x, y, z|
    placement[x] == placement[y] && placement[y] == placement[z]
  }
end

def find_winner(placement)
  index = WIN_COMBOS.find_index { |x, y, z|
    placement[x] == placement[y] && placement[y] == placement[z]
  }
  placement[WIN_COMBOS[index][0]]
end

def draw?(placement)
  placement.all? { |x| x.is_a? String }
end

def complete?(placement)
  win?(placement) || draw?(placement)
end

def player_selection
  puts "**Playing Modes**"
  puts "1: Player1 vs CPU"
  puts "2: Player1 vs Player2"
  puts "Please select your playing mode (1 or 2):"
  p_mode = gets.chomp
  until ["1", "2"].include?(p_mode)
    puts "I'm sorry, your input was not recognized!"
    puts "Please select your playing mode (1 or 2):"
    p_mode = gets.chomp
  end
  p_mode
end

def select_letter
  puts "Player 1, please select a game piece: 'X' or 'O'!"
  player1 = gets.chomp.upcase
  until ["X", "O"].include?(player1)
    puts "I'm sorry, your input was not recognized!"
    puts "Please select 'X' or 'O'!"
    player1 = gets.chomp.upcase
  end
  player2 = ["X","O"].reject { |x| x == player1 }
  puts "Great! \nPlayer 1 will be '#{player1.upcase} \nPlayer 2 will be '#{player2[0]}'"
  player1
end

def print_board(placement)
# ASCII: This will be the middle rows for each column/row subsection
  middle_row_all = [
    [" "*3 + "#{placement[0]}" + " "*3 + "|", " "*3 + "#{placement[1]}" + " "*3 + "|", " "*3 + "#{placement[2]}" + " "*3],
    [" "*3 + "#{placement[3]}" + " "*3 + "|", " "*3 + "#{placement[4]}" + " "*3 + "|", " "*3 + "#{placement[5]}" + " "*3],
    [" "*3 + "#{placement[6]}" + " "*3 + "|", " "*3 + "#{placement[7]}" + " "*3 + "|", " "*3 + "#{placement[8]}" + " "*3]
  ]
# This will be the top rows for each column/row subsection
  tb_row_all = [" "*7 + "|", " "*7 + "|"," "*7]
# This will be the bottom rows for the first and second top subsections
  bottom_row12 = ["_"*7 + "|", "_"*7 + "|", "_"*7]
# This will be the bottom row for the third(last) subsection
  bottom_row_3 = [" "*7 + "|", " "*7 + "|", " "*7]

  puts tb_row_all.join
  puts middle_row_all[0].join
  puts bottom_row12.join
  puts tb_row_all.join
  puts middle_row_all[1].join
  puts bottom_row12.join
  puts tb_row_all.join
  puts middle_row_all[2].join
  puts tb_row_all.join
end

def p_move(placement)
  puts "Where would you like to make your move? (1 - 9)"
  selection = gets.chomp
  available = placement.select { |x| (1..9).to_a.include?(x) }
  until selection =~ /^#{available}$/
    puts "Your input was not recognized."
    puts "Please select an available spot:"
    selection = gets.chomp
  end
  selection.to_i - 1
end

def playing_mode(p_mode)
  p_mode == "1" ? difficulty_mode : multiplayer_start
end

def difficulty_mode
  puts "**Difficulty**"
  puts "1: Normal"
  puts "2: Hard"
  puts "3: Death"
  puts "Please select your difficulty (1, 2, or 3):"
  d_mode = gets.chomp.downcase
  until ["1", "2", "3", "normal", "hard", "death"].include?(d_mode)
    puts "I'm sorry, your selection was not recognized!"
    puts "Please select your difficulty (1, 2, or 3):"
    d_mode = gets.chomp.downcase 
  end
  if ["1", "normal"].include?(d_mode)
    normal_mode
  else
    puts "I'm sorry this feature is not available."
  end
end
    
def play_again?
  puts "Would you like to play again? (Y/N)"
  decision = gets.chomp.downcase
  until ["y", "n", "yes", "no"].include?(decision)
    puts "I'm sorry, your input was not recognized."
    puts "Would you like to play again? (Y/N)"
    decision = gets.chomp.downcase
  end
  ["n", "no"].include?(decision) ? "Thank you for playing!" : start
end

def cpu_move(placement)
  available = placement.select { |x| (1..9).to_a.include?(x) }
  available.sample - 1
end


def normal_mode
  placement = (1..9).to_a
  pieces = ["X", "O"]
  puts "Welcome to Normal Mode!"
  player = select_letter
  current_player = pieces.sample
  cpu = pieces.reject { |x| x == player}
  puts "To choose your placements, input the corresponding"\
    "\nnumber with your desired placement!"\
    "\n(ex: 1 for the top left corner)"
  until complete?(placement)
    print_board(placement)
    puts "It's #{current_player}'s turn!"
    move = current_player == player ? p_move(placement) : cpu_move(placement)
    placement[move] = current_player
    current_player = current_player == player ? "#{cpu[0]}" : player
  end
  print_board(placement)
  if win?(placement)
    win_msg = find_winner(placement) == "X" ? "'X' is the Winner!" : "'O' is the Winner!"
    puts win_msg
  else
    puts "It's a draw!"
  end
  play_again?
end



start


