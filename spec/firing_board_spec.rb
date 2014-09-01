require 'firing_board'

describe FiringBoard do

	let (:firing_board  ) { FiringBoard.new(2,2, linked_ship_board) }
	let (:linked_ship_board ) { double :ship_board, hit_at?: nil     }

	it "is linked with a firing board" do
		expect(firing_board.linked_ship_board).to be linked_ship_board
	end

	it "can accept a shot" do
		expect(linked_ship_board).
			to receive(:hit_at?).
			with(1,1)
		expect(firing_board.fire_at([1,1])).to be firing_board
	end

	it "tracks shots fired" do
		expect(linked_ship_board).
			to receive(:hit_at?).
			with(1,1)
		firing_board.fire_at([1,1])
		expect(firing_board.coordinate_fired_at?(1,1)).to be true
	end

	it "will not let you fire at the same place twice" do
		expect(linked_ship_board).
			to receive(:hit_at?).
			with(1,1)
		firing_board.fire_at([1,1])
		expect{ firing_board.fire_at([1,1]) }.to raise_error(FiringError)
	end

	it "asks the linked ship board if a ship is at a coordinate" do
		expect(linked_ship_board).
			to receive(:hit_at?).
			with(1,1).and_return(true)
		firing_board.fire_at([1,1])
	end

	it "sets the coordinate to 'miss' when a shot misses" do
		allow(linked_ship_board).
			to receive(:hit_at?).
			with(1,1).and_return(false)
		firing_board.fire_at([1,1])
		expect(firing_board.status([1,1])).to be :miss
	end

	it "sets the coordinate to 'hit' when a shot hits a ship" do
		allow(linked_ship_board).
			to receive(:hit_at?).
			with(1,1).and_return(true)
		firing_board.fire_at([1,1])
		expect(firing_board.status([1,1])).to be :hit
	end


end
