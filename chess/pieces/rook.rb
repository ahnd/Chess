require_relative 'sliding_piece'
require_relative 'piece'

class Rook < Piece
  include SlidingPiece

  def move_dirs
    MoveAcross
  end

  def to_s
    "r"
  end

end
