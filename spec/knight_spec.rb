require './lib/knight'

describe Knight do
    subject(:knight) { described_class.new([0, 0]) }

    context "Initializes correctly" do
        it "Has no children" do
            expect(knight.children).to eq([])
        end

        it "Has no parent" do
            expect(knight.parent).to eq(nil)
        end
    end

    context "Calculates next moves correctly" do
        MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]]
        
        let(:next_moves) { MOVES.map do |move|
            move.each_with_index.map { |m, i| m + knight.position[i] unless (m + knight.position[i]).negative? || (m + knight.position[i]) > 7 }
        end }

        it "Maps all possible next moves" do
            expect(next_moves).to eq([[1, 2], [2, 1], [nil, nil], [nil, nil], [1, nil], [nil, 2], [2, nil], [nil, 1]])
        end

        it "Removes moves that go off the board" do
            next_moves.delete_if { |move| move.include?(nil) }
            expect(next_moves).to eq([[1, 2], [2, 1]])
        end
    end
end