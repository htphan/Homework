## Hangman

require 'pry'
require 'set'

def start
  word_list = {
  corgi: "Dog Breed",
  robin: "Bird",
  apple: "Fruit",
  hawaii: "Place",
  computer: "Thing",
  ferrari: "Car",
  bacon: "food",
  }

  turn_count = 7

  guess_set = Set.new

  puts "Whould you like to play a Hangman game? (y/n)"
  response = gets.chomp.downcase
  if response == "y" || response == "yes"
    rand_word_hint = word_list.to_a.sample
    answer = rand_word_hint[0].to_s
    hint = rand_word_hint[1]
    puts "Ok, let's begin!"
    puts "#{"_" * answer.length}"
    puts "Your hint is: #{hint}"
    puts "What letter is your first guess?"
    user_guess = gets.chomp.downcase
    guess_set.add(user_guess)
    guess_attempt(answer, guess_set)
  elsif response == "n" || response == "no"
    puts "Ok... Maybe next time!"
  else
    puts "I'm sorry, your input was not recognized."
    ## recursion
  end
end

def guess_attempt(answer, guesses)
  answer.each_char { |letter|
      if guesses.include?(letter)
        print "#{letter}"
      else
        print "_"
      end
  }
  # if word_complete?
  #   puts "Congratulations! You have solved the answer!"
  #   start
  # else
  #   turn_count -= 1

  # end
end





# answer.chars.to_set == guess_set
#       puts "Congratulations! You have solved the answer!"
#       start


def word_complete?(answer, guess_set)
	if answer.chars.to_set == guess_set
    puts "Congratulations! You have solved the answer!"
    start
  else 

  end



  # answer.chars.to_set == guess_set
end

binding.pry

