require_relative 'ship_spec'
require 'carrier'


describe Carrier do

	it_behaves_like "a ship"
	
	let(:carrier) { Carrier.new }

	it 'knows it is a ship' do
		expect(carrier.class.superclass).to eq(Ship)
	end

end
