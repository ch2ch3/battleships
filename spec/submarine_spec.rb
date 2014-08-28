require_relative 'ship_spec'
require 'submarine'


describe Submarine do

	it_behaves_like "a ship"
	
	let(:submarine) { Submarine.new }

	it 'knows it is a ship' do
		expect(submarine.class.superclass).to eq(Ship)
	end

end
