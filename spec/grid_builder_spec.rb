require 'grid_builder'

describe GridBuilder do

	let(:array) { Array.new(10) { Array.new(10) } }

	it "can take a two-dimensional array" do
		expect(GridBuilder.new(array))
	end

	it "can print a table out of a two-dimensional array" do
		table = GridBuilder.new(array)
		expect(puts table)
	end

	it "changes hits to 'x's" do
		array = Array.new(10) { Array.new(10, :hit) }
		table = GridBuilder.new(array)
		expect(puts table)
	end	

	it "changes misses to 'o's" do
		array = Array.new(10) { Array.new(10, :miss) }
		table = GridBuilder.new(array)
		expect(puts table)
	end

end