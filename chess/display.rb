require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  # attr_reader :
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    display = "Chess Board\n"
    @board.grid.each_with_index do |row, idx1|
      row_disp = ""
      row.each_with_index do |pos, idx2|
        row_disp << " " if pos.nil?
        row_disp << "x" if pos.is_a? Piece
        row_disp[idx2] = row_disp[idx2].colorize(:blue) if [idx1, idx2] == @cursor.cursor_pos
      end
      row_disp += "\n"
      display << row_disp
    end
    puts display
  end

end
