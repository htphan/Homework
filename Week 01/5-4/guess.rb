# Number Guessing Game
# The game picks a random number between 0 and 100
# Each turn the player is asked for a guess
# 	If they don't guess correctly, tell them if they guessed too low or
#  	too high.
# 	If they guess the number, congratulate the user and exit

puts "The Number Guessing Game"

def guess_gets
	puts "Guess a number between 0 and 100!"
	gets.chomp.to_i
end

def game_loop
  puts "The game has randomly selected a number between 0 and 100."
  rand_num = rand(100)
  guess = guess_gets
  until guess == rand_num do
    if guess > rand_num then
      puts "You guess was too high!"
      puts "Let's try again!"
    elsif guess < rand_num then
      puts "Your guess was too low!"
      puts "Let's try again!"
    end
    guess = guess_gets
  end
  puts "Congratulations! You guessed correctly with an answer of #{rand_num}!"
end

game_loop