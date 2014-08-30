require 'board_builder'
require 'ship_board'
require 'firing_board'
require 'ship_element'

describe BoardBuilder do

	let(:array) 		{ Array.new(10) { Array.new(10) } }
	let(:ship_board) 	{ ShipBoard.new(10,10) }
	let(:firing_board)  { FiringBoard.new(10,10, ship_board) }
	let(:ship_element)  { ShipElement.new	}

	context "when it receives a Firing Board" do

		it "can print a table out of a firing board" do
			table = BoardBuilder.new(firing_board)
			puts table
		end

		it "changes hits to 'x's" do
			firing_board.grid.map! {|row| row.map! {|cell| :hit}}
			table = BoardBuilder.new(firing_board)
			expect(puts table)
		end

		it "changes misses to 'o's" do
			firing_board.grid.map! {|row| row.map! {|cell| :miss}}
			table = BoardBuilder.new(firing_board)
			expect(puts table)
		end

		it "does not change the original firing board" do
			control_firing_board = firing_board.grid.dup
			control_firing_board_element = firing_board.grid[0][0]
			BoardBuilder.new(firing_board)
			expect(firing_board.grid).to eq control_firing_board
			expect(firing_board.grid[0][0]).to eq control_firing_board_element
		end

	end

	context "when it creates a ship board" do

		it "can print out a ship board" do
			table = BoardBuilder.new(ship_board)
			puts table
		end

		it "can print out a ship" do
			ship_board.grid.map! {|row| row.map! {|cell| ship_element}}
			table = BoardBuilder.new(ship_board)
			expect(puts table)
		end

		it "can print out damaged ships" do
			ship_element.hit!
			ship_board.grid.map! {|row| row.map! {|cell| ship_element}}
			table = BoardBuilder.new(ship_board)
			expect(puts table)
		end

		it "does not change the original ship board" do
			control_ship_board = ship_board.grid.dup
			control_ship_board_element = ship_board.grid[0][0]
			BoardBuilder.new(ship_board)
			expect(ship_board.grid).to eq control_ship_board
			expect(ship_board.grid[0][0]).to eq control_ship_board_element
		end

	end


end