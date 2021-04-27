require_relative "knight"

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def knight_moves(start, destination)
    current = make_tree(start, destination)
    history = []
    make_history(current, history, start)
    print_knight_moves(history, start, destination)
  end

  def print
    @board.each do |subArr|
      puts subArr.join(" ")
    end
  end

  def make_tree(start, destination)
    queue = [Knight.new(start)]
    current = queue.shift
    until current.position == destination
      current.next_moves.each do |move|
        knight = Knight.new(move, current)
        current.children << knight
        queue << knight
      end
      current = queue.shift
    end
    current
  end

  def make_history(current, history, start)
    until current.position == start
      history << current.position
      current = current.parent
    end
    history << current.position
  end

  def print_knight_moves(history, start, destination)
    puts "You made it in #{history.size - 1} moves! Here's your path:"
    history.reverse.each { |move| puts move.to_s }
  end
end