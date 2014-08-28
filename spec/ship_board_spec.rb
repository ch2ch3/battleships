require 'ship_board'

describe ShipBoard do

	let(:ship_two) {
		double :ship_two,
		length: 2,
		elements: [
				:ship_element_two_one,
				:ship_element__two_two,
			],
			x_coordinate: 1,
			y_coordinate: 1,
			orientation: :horizontal
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
		],
		x_coordinate: 0,
		y_coordinate: 2,
		orientation: :horizontal
	}

  let (:ship) {
		double :ship,
		length: 1,
		elements: :ship_element_one,
		x_coordinate: 1,
		y_coordinate: 1,
		orientation: :horizontal

	}

  let ( :ship_board            )  { ShipBoard.new(9,9) }
  let ( :ship_board_two_by_two )  { ShipBoard.new(2,2) }
  let ( :ship_element              )  { double :ship_element   }


	it 'is initialized with dimensions' do
		expect(ship_board).
			to eq ship_board
	end

	it 'can place a ship in the specified coordinates' do
		allow(ship).to receive(:length).and_return(1)
		allow(ship).
			to receive(:elements).
			and_return([:ship_element_one])
		expect(ship_board.place(ship)).to eq ship_board
	end

	it 'cannot place a ship in a cell that is already occupied' do
		allow(ship).to receive(:length).and_return(1)
		allow(ship).
			to receive(:elements).
			and_return([:ship_element_one])

		ship_board.place(ship)
		expect{ ship_board.place(ship) }.to raise_error
	end

	it 'cannot place a ship outside the boundaries of the ship board' do
		expect{ ship_board_two_by_two.place(ship_two) }
			.to raise_error(PlacementError)
	end

	it 'cannot place a 1x2 ship horizontally in the top-right corner of a 9x9 board' do
		allow(ship).to receive(:length).and_return(2)
		allow(ship).
			to receive(:elements).
			and_return([:ship_element_one, :ship_element_two])
		allow(ship).to receive(:x_coordinate).and_return(8)
		allow(ship).to receive(:y_coordinate).and_return(0)
		allow(ship).to receive(:orientation).and_return(:horizontal)

		expect{ ship_board.place(ship)}
			.to raise_error(PlacementError)
	end

	it 'cannot place a 1x5 ship vertically in square 0,7 of a 9x9 board' do
		allow(ship_five).to receive(:x_coordinate).and_return(0)
		allow(ship_five).to receive(:y_coordinate).and_return(7)
		allow(ship_five).to receive(:orientation).and_return(:vertical)
		expect{ ship_board.place(ship_five)}
			.to raise_error(PlacementError)
	end

	it 'tells a ship element at a coordinate that it has been hit' do
		allow(ship).to receive(:length).and_return(1)
		allow(ship).to receive(:elements).and_return([ship_element])
		ship_board.place(ship)
		expect(ship_element).to receive(:hit!).and_return(true)
		ship_board.hit_at?(1,1)
	end

	it 'returns false when there is no ship element at the coordinate being fired at' do
		expect(ship_board.hit_at?(3,3)).to be false
	end

	it 'places ship elements in the expected board location' do
		allow(ship).to receive(:length).and_return(2)
		allow(ship).
			to receive(:elements).
			and_return([:ship_element_one, :ship_element_two])
		ship_board.place(ship)
		expect(ship_board.cell(0,1)).to be nil
		expect(ship_board.cell(1,1)).to be :ship_element_one
		expect(ship_board.cell(2,1)).to be :ship_element_two
	end

	it 'cannot place a ship over another ship element horizontally' do
		allow(ship_five).to receive(:x_coordinate).and_return(2)
		allow(ship_five).to receive(:y_coordinate).and_return(0)
		allow(ship_five).to receive(:orientation).and_return(:vertical)
		ship_board.place(ship_five)
		expect{ ship_board.place(ship_two) }.to raise_error
	end

	it 'cannot place a ship over another ship element vertically' do
		ship_board.place(ship_five)
		allow(ship_two).to receive(:orientation).and_return(:vertical)
		expect{ ship_board.place(ship_two) }.to raise_error
	end

	it 'will allow ships to be placed touching' do
		ship_board.place(ship_five)
		allow(ship_two).to receive(:x_coordinate).and_return(5)
		allow(ship_two).to receive(:y_coordinate).and_return(1)
		allow(ship_two).to receive(:orientation).and_return(:vertical)
		expect( ship_board.place(ship_two)).to be ship_board
	end

end