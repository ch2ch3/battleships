require 'tracking_grid'

describe TrackingGrid do

	let (:tracking_grid  ) { TrackingGrid.new(2,2, placement_grid) }
	let (:placement_grid ) { double :placement_grid, hit?: nil     }

	it "is initialized with a dimension" do
		expect(tracking_grid.dimensions).to eq [2,2]
	end

	it "is linked with a placement grid" do
		expect(tracking_grid.placement_grid).to be placement_grid
	end

	it "can accept a shot" do
		expect(placement_grid).
			to receive(:hit_at?).
			with(1,1)
		expect(tracking_grid.fire_at(1,1)).to be tracking_grid
	end

	it "tracks shots fired" do
		expect(placement_grid).
			to receive(:hit_at?).
			with(1,1)
		tracking_grid.fire_at(1,1)
		expect(tracking_grid.coordinate_fired_at?(1,1)).to be true
	end

	it "will not let you fire at the same place twice" do
		expect(placement_grid).
			to receive(:hit_at?).
			with(1,1)
		tracking_grid.fire_at(1,1)
		expect{tracking_grid.fire_at(1,1)}.to raise_error
	end

	it "asks the placement grid if a ship is at a coordinate" do
		expect(placement_grid).
			to receive(:hit_at?).
			with(1,1).and_return(true)
		tracking_grid.fire_at(1,1)
	end

	it "sets the coordinate to 'miss' when a shot misses" do
		allow(placement_grid).
			to receive(:hit_at?).
			with(1,1).and_return(false)
		tracking_grid.fire_at(1,1)
		expect(tracking_grid.status(1,1)).to be :miss
	end

	it "sets the coordinate to 'hit' when a shot hits a ship" do
		allow(placement_grid).
			to receive(:hit_at?).
			with(1,1).and_return(true)
		tracking_grid.fire_at(1,1)
		expect(tracking_grid.status(1,1)).to be :hit
	end


end
