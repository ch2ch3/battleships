require 'coordinate_checker'

class TestGame; include CoordinateChecker; end

describe TestGame do

	let(:test_game) { TestGame.new }
	let(:grid_to_check) { Array.new(5) { Array.new(5) } }

	it "knows that (20,20) is outside a 5x5 grid" do
		expect(test_game.valid?(20, 20, grid_to_check)).to be false
	end

	it "knows that (3,3) is inside a 5x5 grid" do
		expect(test_game.valid?(3, 3, grid_to_check)).to be true
	end

	it "knows that (-5, -4) is not inside a 5x5 grid" do
		expect(test_game.valid?(-5, -4, grid_to_check)).to be false
	end

	it "knows that (-5, 3) is not inside a 5x5 grid" do
		expect(test_game.valid?(-5, 3, grid_to_check)).to be false
	end

end