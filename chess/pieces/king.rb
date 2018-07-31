require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
  include SteppingPiece

  def move_dirs
    MoveAcross
  end

  def to_s
    "k"
  end

end
