require 'ship'

shared_examples "a ship" do

	let(:ship_element) { double :ship_element, hit: false }
	let(:hit_ship_element) { double :ship_element, hit: true }
	let(:ship_element_class) 	{ double :ShipElement, new: ship_element}
	let(:ship)			{ described_class.new(ship_element_class) }


	context 'Initialization' do

		it 'can hold ship elements' do
			expect(ship.elements[0]).to eq(ship_element)
		end

	end

	context 'Sunk' do

		it 'knows if it\'s sunk' do
			ship.elements.map! { |element| hit_ship_element }
			expect(ship.sunk?).to be true
		end

		it 'knows that it\'s not sunk' do
			ship.elements[1] = hit_ship_element
			expect(ship.sunk?).to be false
		end

	end

	context 'Placement' do

	it 'can have its starting coordinates set' do
		ship.placement_coordinates(1,2)
		expect(ship.x_coordinate).to eq 1
		expect(ship.y_coordinate).to eq 2
	end

	it 'can have its orientation set' do
		ship.orientation = :horizontal
		expect(ship.orientation).to be :horizontal
	end
end
end
