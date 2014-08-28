require 'board_builder'
require 'ship_board'
require 'firing_board'

describe BoardBuilder do

	let(:array) { Array.new(10) { Array.new(10) } }
	let(:ship_board) { ShipBoard.new }
	let(:ship_board) { ShipBoard.new }

	context "when it receives a Firing Board" do

		it "can print a table out of a firing board" do
			table = BoardBuilder.new(array)
			expect(puts table)
		end

		it "changes hits to 'x's" do
			array = Array.new(10) { Array.new(10, :hit) }
			table = BoardBuilder.new(array)
			expect(puts table)
		end

		it "changes misses to 'o's" do
			array = Array.new(10) { Array.new(10, :miss) }
			table = BoardBuilder.new(array)
			expect(puts table)
		end
	end

end