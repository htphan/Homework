class Cpu

  def initialize(piece)
    @piece = piece
  end

  def current_piece
    @piece
  end

  def select_placement(available)
    @move = available.sample
    @move = @move - 1
  end
end