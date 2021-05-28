require_relative "knight"

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def knight_moves(start, destination) #start = [0,0] destination = [1,2]
    current = make_tree(start, destination) #current is a Knight at the correct destination
    history = []
    make_history(current, history, start) #completes history array showing Knight's path
    print_knight_moves(history, start, destination) #prints number of moves and history
  end

  def print
    @board.each do |subArr|
      puts subArr.join(" ")
    end
  end

  def make_tree(start, destination) #[0,0], [1,2]
    queue = [Knight.new(start)] #create a new Knight at the start position
    current = queue.shift #returns first element of queue
    until current.position == destination #while the current knight is not at destination [1,2]
      current.next_moves.each do |move| #next moves function in Knight class, returns an array of possible next moves
        knight = Knight.new(move, current) #creates new Knight with moved position and current position as parent Knight in tree
        current.children << knight #new Knight is then placed as a child of the parent Knight
        queue << knight #new Knight is added to the queue
      end
      current = queue.shift #returns first element of queue, loops back to next_moves.each unless it's now at the destination
    end
    current #returns current Knight
  end

  def make_history(current, history, start) #creates the path the Knight took
    until current.position == start #until you're back to the starting position
      history << current.position #shovel the current Knight position into history array
      current = current.parent #go to the parent of the current Knight and loop
    end
    history << current.position #shovel current position of starting Knight, return history array
  end

  def print_knight_moves(history, start, destination)
    puts "You made it in #{history.size - 1} moves! Here's your path:" #how many moves?
    history.reverse.each { |move| puts move.to_s } #prints history starting at beginning (reverse array) and going to end
  end
end