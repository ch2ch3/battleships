require 'ship'

describe Ship do

	let(:ship)   	   	{ Ship.new(:ship) }
	let(:ship_element) 	{ ShipElement.new}
	let(:carrier)		{ Ship.new(:carrier) }
	let(:battleship)	{ Ship.new(:battleship) }
	let(:submarine)		{ Ship.new(:submarine) }
	let(:destroyer)		{ Ship.new(:destroyer) }
	let(:patrol_boat)	{ Ship.new(:patrol_boat) }

context 'Initialization' do
	it 'can hold ship elements' do
	expect(ship.elements.count).to eq(1)
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

end