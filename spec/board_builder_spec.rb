require 'board_builder'
require 'ship_board'
require 'firing_board'

describe BoardBuilder do

	let(:array)        { Array.new(10) { Array.new(10) }    }
	let(:ship_board)   { ShipBoard.new(10,10)               }
	let(:firing_board) { FiringBoard.new(10,10, ship_board) }

	context "when it receives a Firing Board" do

		it "can print a table out of a firing board" do
			table = BoardBuilder.new(firing_board)
			puts table
		end

		it "changes hits to 'x's" do
			table = BoardBuilder.new(firing_board)
			expect(puts table)
		end

		it "changes misses to 'o's" do
			table = BoardBuilder.new(firing_board)
			expect(puts table)
		end
	end

end