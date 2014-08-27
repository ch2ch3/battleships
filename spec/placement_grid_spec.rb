require 'placement_grid'

describe PlacementGrid do
	let(:ship_two) {
		double :ship_two,
		length: 2,
		elements: [
				:ship_element_two_one,
				:ship_element__two_two,
			]
		}

	let(:ship_five) {
		double :ship_five,
		length: 5,
		elements: [
			:ship_element_one,
			:ship_element_two,
			:ship_element_three,
			:ship_element_four,
			:ship_element_five
		]
	}

  let ( :placement_grid            )  { PlacementGrid.new(9,9) }
  let ( :placement_grid_two_by_two )  { PlacementGrid.new(2,2) }
  let ( :ship                      )  { double :ship           }
  let ( :ship_element              )  { double :ship_element   }

	it 'is initialized with dimensions' do
		expect(placement_grid).
			to eq placement_grid
	end

	it 'can place a ship in the specified coordinates' do
		allow(ship).to receive(:length).and_return(1)
		allow(ship).
			to receive(:elements).
			and_return([:ship_element_one])
		expect(placement_grid.place(ship,1,1)).to eq placement_grid
	end

	it 'cannot place a ship in a cell that is already occupied' do
		allow(ship).to receive(:length).and_return(1)
		allow(ship).
			to receive(:elements).
			and_return([:ship_element_one])

		placement_grid.place(ship,1,1)
		expect{ placement_grid.place(ship,1,1) }.to raise_error
	end

	it 'cannot place a ship outside the boundaries of the placement grid' do
		expect{ placement_grid_two_by_two.place(ship_two,1,1) }
			.to raise_error(ArgumentError)
	end

	it 'cannot place a 1x2 ship horizontally in the top-right corner of a 9x9 grid' do
		allow(ship).to receive(:length).and_return(2)
		allow(ship).
			to receive(:elements).
			and_return([:ship_element_one, :ship_element_two])

		expect{ placement_grid.place(ship, 8, 0)}
			.to raise_error(ArgumentError)
	end

	it 'cannot place a 1x5 ship vertically in square 0,7 of a 9x9 grid' do
		expect{ placement_grid.place(ship_five, 0, 7, :vertical)}
			.to raise_error(ArgumentError)
	end

	it 'tells a ship element at a coordinate that it has been hit' do
		allow(ship).to receive(:length).and_return(1)
		allow(ship).to receive(:elements).and_return([ship_element])
		placement_grid.place(ship,1,1)
		expect(ship_element).to receive(:hit!).and_return(true)
		placement_grid.hit_at?(1,1)
	end

	it 'returns false when there is no ship element at the coordinate being fired at' do
		expect(placement_grid.hit_at?(3,3)).to be false
	end

	it 'places ship elements in the expected grid location' do
		allow(ship).to receive(:length).and_return(2)
		allow(ship).
			to receive(:elements).
			and_return([:ship_element_one, :ship_element_two])

		placement_grid.place(ship,2,2)
		expect(placement_grid.cell(1,1)).to be nil
		expect(placement_grid.cell(2,2)).to be :ship_element_one
		expect(placement_grid.cell(3,2)).to be :ship_element_two
	end

	it 'cannot place a ship over another ship element horizontally' do
			placement_grid.place(ship_five, 2, 0, :vertical)
			expect{ placement_grid.place(ship_two,1,1) }.to raise_error
	end

	it 'cannot place a ship over another ship element vertically' do
			placement_grid.place(ship_five, 0, 2, :horizontal)
			expect{ placement_grid.place(ship_two,1,1, :vertical) }.to raise_error
	end

	it 'will allow ships to be placed touching' do
		placement_grid.place(ship_five, 0, 2, :horizontal)
		expect( placement_grid.place(ship_two, 5, 1, :vertical )).to be placement_grid
end

end