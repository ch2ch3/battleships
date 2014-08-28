require_relative 'ship_spec'
require 'battleship'


describe Battleship do

	it_behaves_like "a ship"
	
	let(:battleship) { Battleship.new }

	it 'knows it is a ship' do
		expect(battleship.class.superclass).to eq(Ship)
	end

end
