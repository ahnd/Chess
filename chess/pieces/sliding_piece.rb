require "byebug"
module SlidingPiece
  MoveDiag = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  MoveAcross = [[-1, 0], [1, 0], [0, 1], [0, -1]]

  def moves
    total_moves = self.move_dirs #subclass-dependant method
    unblocked_moves = []

    total_moves.each do |direction|
      path_in_direction = grow_unblocked_moves_in_direction(direction)
      unblocked_moves.concat(path_in_direction)
    end

    unblocked_moves
  end

  def move_dirs
  end

  def grow_unblocked_moves_in_direction(direction)
    debugger
    unblocked_moves = [self.pos]

    until unblocked_moves.last.any? { |coord| coord > 7 && coord < 0 }
      current_pos = self.board[self.pos[0] + direction[0]][self.pos[1] + direction[1]]
      unblocked_moves << current_pos
      next_pos = self.board[current_pos[0] + direction[0]][current_pos[1] + direction[1]]
      return unblocked_moves if next_pos.color == self.color
      if next_pos.color == enemy
        unblocked_moves << next_pos
        return unblocked_moves
      end
    end

    unblocked_moves.pop
    unblocked_moves
  end
end
