require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  def move_dirs
    MoveAcross
  end

  def to_s
    "h"
  end

end
