require_relative 'piece'
require_relative 'stepping_piece'

class Pawn < Piece
  include SteppingPiece

  def move_dirs
    #TODO forward and diagnal attacks
  end

  def to_s
    "p"
  end

end
