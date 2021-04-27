require_relative "board"

knight = Board.new

knight.knight_moves([0, 0], [1, 2])
puts ""

knight.knight_moves([0, 0], [3, 3])
puts ""

knight.knight_moves([3, 3], [0, 0])
puts ""

knight.knight_moves([3, 3], [4, 3])
puts ""