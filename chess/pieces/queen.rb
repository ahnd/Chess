require_relative 'sliding_piece'
require_relative 'piece'

class Queen < Piece
  include SlidingPiece

  def move_dirs
    MoveDiag + MoveAcross
  end

  def to_s
    "q"
  end

end
