require 'ship'

shared_examples "a ship" do

	let(:ship_element) 	{ ShipElement.new        }
	let(:ship)			{ described_class.new     }


	context 'Initialization' do

		it 'can hold ship elements' do
			expect(ship.elements[0].class).to eq(ShipElement)
		end

		it 'initializes with the correct number of ship elements for its type' do
			expect(ship.elements.count).to eq(ship.size)
		end
	end

	context 'Sunk' do

		it 'knows if it\'s sunk' do
			ship.elements.each { |element| element.hit! }
			expect(ship.sunk?).to be true
		end

		it 'knows that it\'s not sunk' do
			ship.elements[1].hit!
			expect(ship.sunk?).to be false
		end

	end

	context 'Placement' do

	it 'can tell you how long it is' do
		expect(ship.length).to be (ship.size)
	end

	it 'can have its starting coordinates set' do
		ship.placement_coordinates([1,2])
		expect(ship.x_coordinate).to eq 1
		expect(ship.y_coordinate).to eq 2
	end

	it 'can have its orientation set' do
		ship.orientation = :horizontal
		expect(ship.orientation).to be :horizontal
	end
end
end