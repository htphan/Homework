## NATO Alphabet
def start
	alphabet_hash = {
		a: :alpha,
		b: :bravo,
		c: :charlie,
		d: :delta,
		e: :echo,
		f: :foxtrot,
		g: :golf,
		h: :hotel,
		i: :india,
		j: :juliet,
		k: :kilo,
		l: :lima,
		m: :mike,
		n: :november,
		o: :oscar,
		p: :papa,
		q: :quebec,
		r: :romeo,
		s: :sierra,
		t: :tango,
		u: :uniform,
		v: :victor,
		w: :whiskey,
		x: :xray,
		y: :yankee,
		z: :zulu,
		:" " => :space
	}

  puts "Would you like to encode or decode? (Choose: Encode/Decode)"
  user_input = gets.chomp.downcase
	if user_input == "encode"
		puts "What would you like to encode?"
		user_string = gets.chomp.downcase
		encode(alphabet_hash, user_string)
	elsif user_input == "decode"
		puts "What would you like to decode?\n (Please separate each code with a space, "\
			"ex: hotel india ! => hi!)"
		user_string = gets.chomp.downcase
		decode(alphabet_hash, user_string)
	else
		puts "Your input was not recognized, please write 'encode' or 'decode'."
		start
	end
end

def encode(hash, string)
	new_array = string.chars.map { |key| key.to_sym }
	encoded_array = []
	new_array.each { |key|
		if hash.has_key?(key)
			encoded_array << hash[key]
		else
			encoded_array << key.to_s
		end
	}
	puts "This is the encoded version of your input: "
	puts "#{encoded_array.join(" ")}"
	decision
end

def decode(hash, string)
  new_array = string.split.map { |value| value.to_sym }
	decoded_array = []
	new_array.each { |value|
		if hash.has_value?(value)
			decoded_array << hash.invert[value]
		else
			decoded_array << value.to_s
		end
	}
	puts "This is the decoded version of your input: "
	puts "#{decoded_array.join("")}"
	decision
end

def decision
	puts "Would you like to try this again? (y/n)"
	user_decision = gets.chomp.downcase
	if user_decision == "y" || user_decision == "yes"
		start
	elsif user_decision == "n" || user_decision == "no"
		puts "Thank you for trying the Encode and Decode functions!"
	else 
		puts "I'm sorry your input was not recognized, please try again!"
		decision
	end
end


start







