require 'ship_element'

describe ShipElement do
	let(:ship_element) { ShipElement.new }

context 'Initialization' do
	it 'initializes unhit' do
		expect(ship_element.hit).to be false
		end
	end

context 'Being shot at' do
	it 'is able to be hit' do
		ship_element.hit!
		expect(ship_element.hit).to be true
	end
end

end