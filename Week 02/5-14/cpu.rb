class Cpu

  def initialize(piece)
    @piece = piece
  end

  def current_piece
    @piece
  end

  def select_placement
    @move = (1..9).to_a
    @move.sample - 1
  end
end