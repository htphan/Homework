## Hangman Game

require 'pry'
require 'set'

def start
  word_list = {
  corgi: "Animal",
  robin: "Animal",
  apple: "Food",
  hawaii: "Place",
  computer: "Thing",
  ferrari: "Transportation",
  bacon: "Food",
  yacht: "Transportation",
  train: "Transportation",
  tagolog: "Language",
  german: "Language",
  basketball: "Sport",
  football: "Sport",
  tennis: "Sport",
  spaghetti: "Food",
  sandwich: "Food",
  germany: "Place",
  luxembourg: "Place",
  television: "Thing",
  baseball: "Sport",
  table: "Thing",
  mailbox: "Thing",
  january: "Month",
  december: "Month",
  august: "Month",
  france: "Place",
  market: "Place",
  buffalo: "Animal",
  quokka: "Animal",
  }

  count = 7

  guess_set = Set.new

  repeat = []

  rand_word_hint = word_list.to_a.sample
  answer = rand_word_hint[0].to_s
  hint = rand_word_hint[1]

  response = gets.chomp.downcase
  if response == "y" || response == "yes"
    puts "Ok, let's begin!"
    puts "#{"_" * answer.length}"
    puts "Your hint is: #{hint}"
    puts "What letter is your first guess?"
    user_guess = gets.chomp.downcase
    guess_print(answer, guess_set, user_guess, count, repeat)
  elsif response == "n" || response == "no"
    puts "Ok... Maybe next time!"
  else
    puts "I'm sorry, your input was not recognized. Please type 'yes' or 'no'."
    start
  end
end

def guess_print(answer, guess_set, user_guess, count, repeat)
  unless user_guess.chars.count > 1 
    guess_set.add(user_guess)
    answer.each_char { |letter|
      if guess_set.include?(letter)
        print "#{letter}"
      else
        print "_"
      end
    }
  else
    user_guess.chars.count > 1 
    puts "You can only guess ONE letter!"
    guess_next(answer, guess_set, count, repeat)
  end
  print "\n" + "Used Letters: #{guess_set.to_a.join}"
  word_complete(answer, guess_set, user_guess, count, repeat)
end

def word_complete(answer, guess_set, user_guess, count, repeat)
	if answer.chars.to_set.subset? guess_set
    puts "\n" + "Congratulations! You have solved the answer!"
    puts "Would you like to try again? (y/n)"
    start
  elsif repeat.include?(user_guess)
    puts "\n" + "You already guessed the letter #{user_guess}!"
    guess_next(answer, guess_set, count, repeat)
  elsif  answer.chars.to_a.include?(user_guess)
    puts "\n" + "Remaining guesses: #{count}"
    repeat << user_guess
    guess_next(answer, guess_set, count, repeat)
  else
    repeat << user_guess
    count -= 1 
    puts "\n" + "Remaining guesses: #{count}"
    unless count == 0
      guess_next(answer, guess_set, count, repeat)
    else
      puts "You ran out of guesses!"
      puts "The answer was '#{answer}'"
      puts "Would you like to try again? (y/n)"
      start
    end
  end
end

def guess_next(answer, guess_set, count, repeat)
  puts "What is your next guess?"
  next_guess = gets.chomp.downcase
  guess_print(answer, guess_set, next_guess, count, repeat)
end

puts "Would you like to play a Hangman game? (y/n)"
start
