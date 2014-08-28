require 'board_builder'

describe BoardBuilder do

	let(:array) { Array.new(10) { Array.new(10) } }

	it "can take a two-dimensional array" do
		expect(BoardBuilder.new(array))
	end

	it "can print a table out of a two-dimensional array" do
		table = BoardBuilder.new(array)
		expect(puts table)
	end

	it "changes hits to 'x's" do
		array = Array.new(10) { Array.new(10, :hit) }
		table = BoardBuilder.new(array)
		expect(puts table)
	end	

	it "changes misses to 'o's" do
		array = Array.new(10) { Array.new(10, :miss) }
		table = BoardBuilder.new(array)
		expect(puts table)
	end

end