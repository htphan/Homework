require 'pry'

placement = [
    ["X", 2, 3], 
    [4, 5, 6], 
    [7, 8, 9]
]

def cpu_move(placement)
  remaining_spots = []
  placement.each_index { |x| 
    placement[x].each_index { |y| 
      unless placement[x][y] == "X"
        remaining_spots.push(placement[x][y])
      end
    }
  }
end


def play_again
  puts "Would you like to play again? (Y/N)"
  decision = gets.chomp.downcase
  until ["y", "n", "yes", "no"].include?(decision)
    puts "I'm sorry, your input was not recognized."
    puts "Would you like to play again? (Y/N)"
    decision = gets.chomp.downcase
  end
  unless decision == "n" || decision == "no"
    start
  else
    puts "Thank you for playing!"
  end
end




  if win_combos.each { |i| a.push(i.to_set.subset?(p1.to_set)) }
    true
  else
    false
  end


binding.pry