#Test-Hangman

require "set"

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

guesses = Set.new

rand_word_hint = word_list.to_a.sample
answer = rand_word_hint[0].to_s
hint = rand_word_hint[1]
puts "Ok, let's begin!"
puts "#{"_" * answer.length}"
puts "Your hint is: #{hint}"
puts "What letter is your first guess?"
user_guess = gets.chomp.downcase
guesses.add(user_guess)
guesses 

