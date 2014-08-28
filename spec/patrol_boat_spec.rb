require_relative 'ship_spec'
require 'patrol_boat'


describe PatrolBoat do

	it_behaves_like "a ship"
	
	let(:patrol_boat) { PatrolBoat.new }

	it 'knows it is a ship' do
		expect(patrol_boat.class.superclass).to eq(Ship)
	end

end
