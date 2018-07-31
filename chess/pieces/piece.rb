class Piece
  attr_accessor :pos, :board
  attr_reader :color

  def initialize(pos, board)
    @pos = pos
    @board = board
    @color = color
  end

  def moves

  end

  def to_s
    "x"
  end
end
