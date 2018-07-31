require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    MoveDiag
  end

  def to_s
    "b"
  end

end
