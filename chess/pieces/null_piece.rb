require_relative 'piece'
require 'Singleton'

class NullPiece < Piece
  include Singleton

  attr_reader :color

  def initialize
    @color = :green
  end

  def to_s
    " "
  end
end
