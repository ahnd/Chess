require 'byebug'
require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def full_render
    input = self.cursor.render
    until input == :ctrl_c
      self.render
      input = self.cursor.render
      system ("clear")
    end
  end

  def render
    # debugger
    view = "Chess Board\n"
    self.board.grid.each_with_index do |row, idx1|
      row_disp = ""
      row.each_with_index do |piece, idx2|
        color = piece.color
        background = :white

        #cursor toggle
        if [idx1, idx2] == cursor.cursor_pos
          if cursor.selected
            background = :red
          else
            background = :green
          end
        else
          if (idx1.even? && idx2.even?) || (idx1.odd? && idx2.odd?)
            background = :black
          end

        end

        row_disp << piece.to_s.colorize({ color: color, background: background})
      end
      row_disp += "\n"
      view << row_disp
    end
    puts view
  end

end
