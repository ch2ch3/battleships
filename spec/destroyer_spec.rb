require_relative 'ship_spec'
require 'destroyer'


describe Destroyer do

	it_behaves_like "a ship"
	
	let(:destroyer) { Destroyer.new }

	it 'knows it is a ship' do
		expect(destroyer.class.superclass).to eq(Ship)
	end

end
