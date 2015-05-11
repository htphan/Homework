# Destutter Function

array = [1, 2, 3, 4, 4, 3, 2, 1, 1]

def destutter(array)
	new_array = []
	last = nil
	array.each do |x|
	  new_array.push(x) unless last == x
	  last = x
	end
	new_array
end

def remove_dup(array)
  new_array = []
  array.each do |x|
    new_array.push(x) unless new_array.include?(x)
  end
  new_array
end  

puts "The input array is #{array}"
puts "The new array with the destutter function used is #{destutter(array)}"
puts "The new array with duplicates removed is #{remove_dup(array)}" 

puts "Would you like to create your own array? (y/n)"
def personal_array
  answer = gets.chomp.downcase 
  if answer == "y"
    puts "Please enter your integer array separated by spaces (ex: 1 2 3 4)."
    gets_array = gets.chomp.split(" ")
    gets_array_int = []
    gets_array.each do |x|
      gets_array_int.push(x.to_i)
    end
    puts "Your input array is #{gets_array_int}"
    puts "The new array with the destutter function used is #{destutter(gets_array_int)}"
    puts "The new array with duplicates removed is #{remove_dup(gets_array_int)}" 
  else
    puts "Thank you for trying the Destutter and Remove Duplicates functions!"
  end
end

personal_array