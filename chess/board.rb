require_relative 'pieces/pieces'

class NoPieceError < StandardError; end
class InvalidMoveError < StandardError; end

class Board
  attr_accessor :grid
  # Layout = [Rook.new([0,0])]
  def initialize()
    @grid = Array.new(8){ Array.new(8) }
    setup
  end

  def setup
    self.grid.each_with_index do |row, idx1|
      row.each_with_index do |el, idx2|
        pos = [idx1, idx2]
        if idx1 < 2 || idx1 > 5
          self[pos] = Piece.new(pos, self)
        else
          self[pos] = NullPiece.instance
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise NoPieceError.new "No piece in starting position." if self[start_pos].nil?
    raise InvalidMoveError.new "Out of bounds." unless Board.valid?(end_pos)
    self[start_pos].pos = end_pos
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def self.valid?(pos)
    pos.all? { |coord| coord < 8 && coord >= 0 }
  end

  # private
  def [](pos)
    row, col = pos
    self.grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    self.grid[row][col] = val
  end

end
