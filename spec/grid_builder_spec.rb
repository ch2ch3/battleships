require 'grid_builder'

describe GridBuilder do

	let(:array) { Array.new(10) { Array.new(10) } }


	context "when it receives a Firing Board" do

		it "can print a table out of a firing board" do
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

end