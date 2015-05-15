class Player
  def initialize(piece)
    @piece = piece
  end

  def current_piece
    @piece
  end

  def select_placement(available)
    puts "Where would you like to move? (1-9)"
    @move = gets.chomp.to_i
    until available.include?(@move)
      puts "Your input was not recognized."
      puts "Please select a number between 1 and 9:"
      @move = gets.chomp.to_i
    end
    @move = @move - 1
  end
end