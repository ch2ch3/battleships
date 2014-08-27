require 'ship'

describe Ship do

	let(:ship_element) 	{ ShipElement.new        }
	let(:carrier)		{ Ship.new(:carrier)     }
	let(:battleship)	{ Ship.new(:battleship)  }
	let(:submarine)		{ Ship.new(:submarine)   }
	let(:destroyer)		{ Ship.new(:destroyer)   }
	let(:patrol_boat)	{ Ship.new(:patrol_boat) }

	context 'Initialization' do

		it 'can hold ship elements' do
			expect(patrol_boat.elements.count).to eq(2)
		end

		it 'initializes with the correct number of ship elements for its type' do
			expect(carrier.elements.count).to eq(5)
			expect(battleship.elements.count).to eq(4)
			expect(destroyer.elements.count).to eq(3)
			expect(submarine.elements.count).to eq(3)
			expect(patrol_boat.elements.count).to eq(2)
		end
	end

	context 'Type' do

		it 'knows what kind of ship it is' do
			expect(battleship.type).to eq(:battleship)
		end
	end

	context 'Sunk' do

		it 'knows if it\'s sunk' do
			patrol_boat.elements.each { |element| element.hit! }
			expect(patrol_boat.sunk?).to be true
		end

		it 'knows that it\'s not sunk' do
			patrol_boat.elements[1].hit!
			expect(patrol_boat.sunk?).to be false
		end

	end

	it 'can tell you how long it is' do
		expect(patrol_boat.length).to be 2
	end

	it 'can have its starting coordinates set' do
		patrol_boat.placement_coordinates([1,2])
		expect(patrol_boat.x_coordinate).to eq 1
		expect(patrol_boat.y_coordinate).to eq 2
	end

	it 'can have its orientation set' do
		patrol_boat.orientation = :horizontal
		expect(patrol_boat.orientation).to be :horizontal
	end

end