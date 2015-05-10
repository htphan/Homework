# Tic-Tac-Toe Game

## ASCII for the Tic-Tac-Toe Table:
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

Place_hash = {
1 => [0, 0],
2 => [0, 1],
3 => [0, 2],
4 => [1, 0],
5 => [1, 1],
6 => [1, 2],
7 => [2, 0],
8 => [2, 1],
9 => [2, 2]
}


def start
  puts "Welcome to Tic-Tac-Toe!"
  puts "**Playing Modes**"
  puts "1: Player1 vs CPU"
  puts "2: Player1 vs Player2"
  puts "Please select your playing mode (1 or 2):"
  p_mode = gets.chomp   # p_mode will be the playing mode selected by the user
  playing_mode(p_mode)
end

def playing_mode(p_mode)    
  until ["1", "2"].include?(p_mode)
    puts "I'm sorry, your input was not recognized!"
    puts "Please select your playing mode (1 or 2):"
    p_mode = gets.chomp
  end
  if p_mode == "1"
    difficulty_mode 
  else
    puts "This feature is currently not available :("   
  end
end

def difficulty_mode
# These are the placements of each subsection in the board as seen above.
# The numbers in each array corresponds to the board above when printed.
  placement = [
    [1, 2, 3], 
    [4, 5, 6], 
    [7, 8, 9]
  ]

# Turn count will be used to monitor the player's turn.
  turn_count = 0 
# This will store past Player1 selections
  p1_past = [0]
# This will store past Player2 or CPU selections
  opp_past = [0]

  puts "**Difficulty**"
  puts "1: Normal"
  puts "2: Hard"
  puts "3: Death"
  puts "Please select your difficulty (1, 2, or 3):"
  d_mode = gets.chomp.downcase  # d_mode will be the difficulty selected by the user
  d_options = ["1", "2", "3", "normal", "hard", "death"]
  until d_options.include?(d_mode)
    puts "I'm sorry, your selection was not recognized!"
    puts "Please select your difficulty (1, 2, or 3):"
    d_mode = gets.chomp.downcase 
  end
  if d_mode == "1" || d_mode == "normal"
    normal_start(placement, turn_count, p1_past, opp_past)
  elsif d_mode == "2" || d_mode == "hard"
    puts "This feature is currently not available" 
  else d_mode == "3" || d_mode == "death"
    puts "This feature is currently not available" 
  end 
end

def print_board(placement)    # u_place = user-decided placement
# ASCII: This will be the middle rows for each column/row subsection
  middle_row_all = [
    [" "*3 + "#{placement[0][0]}" + " "*3 + "|", " "*3 + "#{placement[0][1]}" + " "*3 + "|", " "*3 + "#{placement[0][2]}" + " "*3],
    [" "*3 + "#{placement[1][0]}" + " "*3 + "|", " "*3 + "#{placement[1][1]}" + " "*3 + "|", " "*3 + "#{placement[1][2]}" + " "*3],
    [" "*3 + "#{placement[2][0]}" + " "*3 + "|", " "*3 + "#{placement[2][1]}" + " "*3 + "|", " "*3 + "#{placement[2][2]}" + " "*3]
  ]

# This will be the top rows for each column/row subsection
  top_row_all = [" "*7 + "|", " "*7 + "|"," "*7]

# This will be the bottom rows for the first and second top subsections
  bottom_row12 = ["_"*7 + "|", "_"*7 + "|", "_"*7]

# This will be the bottom row for the third(last) subsection
  bottom_row_3 = [" "*7 + "|", " "*7 + "|", " "*7]

  puts top_row_all.join
  puts middle_row_all[0].join
  puts bottom_row12.join
  puts top_row_all.join
  puts middle_row_all[1].join
  puts bottom_row12.join
  puts top_row_all.join
  puts middle_row_all[2].join
  puts bottom_row_3.join
end

def normal_start(placement, turn_count, p1_past, opp_past)
  d_mode = "1"
  puts "Welcome to Normal Mode!"
  puts "You will be the 'X' piece in this game."
  puts "To choose your placements, input the corresponding"\
    "\nnumber with your desired placement!"\
    "\n(ex: 1 for the top left corner)"
  p1_move(placement, turn_count, p1_past, opp_past)     # opp_past == Player2 or CPU past selections
end

# The function verify_i verfies if the user's input is an integer between 1 and 9

def verify_i(place)
  until (1..9).include?(place)
    puts "I'm sorry, your input was not recognized."
    puts "Where would you like to make your move? (1 - 9)"
    place = gets.chomp.to_i
  end
  true
end

def verify_avail(placement, place, turn_count, p1_past, opp_past)
  place_arr = Place_hash[place]
  place_value = placement[place_arr[0]][place_arr[1]]
  used_spot = ["X", "O"]
  if used_spot.include?(place_value)
    puts "This spot has been taken already!"
    p1_move(placement, turn_count, p1_past, opp_past)
  end
  true
end

def find_replace(placement, place, turn_count, p1_past, opp_past)
  place_arr = Place_hash[place]
  # used_spot = ["X", "O"]



  # first_a = nil     # index of the first array that includes u_place
  # second_a = nil    # index of the second array that include u_place
  # placement.each_index { |e|
  #     if placement[e].include?(place)
  #       first_a = e
  #       second_a = placement[e].index(place)
  #     end
  # }



  # if used_spot.include?(place_value)
  #   puts "This spot has been taken already!"
  #   p1_move(placement, turn_count, p1_past, opp_past)
  if turn_count % 2 == 0
    placement[place_arr[0]][place_arr[1]] = "X"
    if is_complete?(p1_past, opp_past)
      print_board(placement)
      puts "Congratulations! You Won!"
      play_again?
    else
      if tie?(p1_past, opp_past) 
        play_again?
      else  
        turn_count += 1
        cpu_move(placement, turn_count, p1_past, opp_past)
      end
    end
  else
    placement[place_arr[0]][place_arr[1]] = "O"
    if is_complete?(p1_past, opp_past)
      print_board(placement)
      puts "You Lost!"
      play_again?
    else
      if tie?(p1_past, opp_past) 
        play_again?
      else  
        turn_count += 1
        p1_move(placement, turn_count, p1_past, opp_past)
      end
    end
  end
end

def p1_move(placement, turn_count, p1_past, opp_past)
  print_board(placement)
  puts "Where would you like to make your move? (1 - 9)"
  u_place = gets.chomp.to_i
  if verify_i(u_place) && verify_avail(placement, u_place, turn_count, p1_past, opp_past)
    p1_past << u_place
    find_replace(placement, u_place, turn_count, p1_past, opp_past)
  else
    find_replace(placement, u_place, turn_count, p1_past, opp_past)
  end
end

def cpu_move(placement, turn_count, p1_past, cpu_past)
  # The variable cpu_past == opp_past
  remaining_spots = []
  placement.each_index { |x| 
    placement[x].each_index { |y| 
      unless placement[x][y] == "X" || placement[x][y] == "O"
        remaining_spots.push(placement[x][y])
      end
    }
  }
  cpu_place = remaining_spots.sample
  if verify_i(cpu_place) && verify_avail(placement, cpu_place, turn_count, p1_past, cpu_past)
    cpu_past << cpu_place
    find_replace(placement, cpu_place, turn_count, p1_past, cpu_past)
  else
    find_replace(placement, cpu_place, turn_count, p1_past, cpu_past)
  end
end

# Each set in the function is_complete? is a possible winning combination
def is_complete?(p1_past, opp_past)
#All possible winning combinations
  a1 = [1,2,3]
  a2 = [4,5,6]
  a3 = [7,8,9]
  c1 = [1,4,7]
  c2 = [2,5,8]
  c3 = [3,6,9]
  d1 = [7,5,3]
  d2 = [1,5,9]
  win_combos = [a1, a2, a3, c1, c2, c3, d1, d2]
  p1_win = [] # p1_win returns an array of true/false for each winning comboination for Player1
  opp_win = [] # opp_win returns an array of true/false for each winning comboination Player2/CPU
  win_combos.each { |i| p1_win.push(i.to_set.subset?(p1_past.to_set)) }
  win_combos.each { |i| opp_win.push(i.to_set.subset?(opp_past.to_set)) }
  p1_win.include?(true) || opp_win.include?(true)
end

def tie?(p1_past, opp_past)
# Incase of a TIE
  all_moves = (1..9).to_set
  completed_moves = p1_past + opp_past
  if all_moves.subset?(completed_moves.to_set)
    puts "It's a TIE!"
    return true
  else
    return false
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
  if decision == "n" || decision == "no"
    puts "Thank you for playing!"
  else
    start
  end
end

start




