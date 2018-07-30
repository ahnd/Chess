require_relative 'piece'


class NoPieceError < StandardError; end
class InvalidMoveError < StandardError; end


class Board
  attr_accessor :grid

  def initialize()
    @grid = Array.new(8){ Array.new(8) }
    setup
  end

  def setup
    @grid.each_with_index do |row, idx|
      row.each_with_index do |el, idx2|
        self[[idx, idx2]] = Piece.new([idx, idx2]) unless (idx > 1 && idx < 6)
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise NoPieceError.new "No piece in starting position." if self[start_pos].nil?
    raise InvalidMoveError.new "Out of bounds." unless Board.valid?(end_pos)
    self[start_pos].pos = end_pos
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  private
  def self.valid?(pos)
    pos.all? { |coord| coord < 8 && coord >= 0 }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

end
