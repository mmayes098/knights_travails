class Knight
  attr_reader :position
  attr_accessor :children, :parent

  MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]]
  #MOVES is a list of all the possible ways a Knight can travel, up 1 and right 2, up 2 and right 1, etc.

  def initialize(position, parent = nil)
    @position = position #[0,0]
    @children = []
    @parent = parent
  end

  def next_moves
    next_moves = MOVES.map do |move| #maps each possible move (move is an array)
      move.each_with_index.map { |m, i| m + @position[i] unless (m + @position[i]).negative? || (m + @position[i]) > 7 } #adds each possible move to the current position to create a list of 8 possible locations the knight can travel to
    end
    next_moves.delete_if { |move| move.include?(nil) } #list of moves include nil if off the board, this removes those possibilities and returns the list of next moves
  end
end