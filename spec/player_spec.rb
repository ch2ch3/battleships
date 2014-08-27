require 'player'

describe Player do

	let(:player_1) { Player.new }

	it "should be able to hold ships" do
		expect(player_1.ships.class).to eq Array
	end

	it "can build and hold all the ships" do
		player_1.build_ships
		expect(player_1.ships.count).to eq (5)
	end

	it "initializes with all their ships" do
		expect(player_1.ships.count).to eq 5
	end

	it "can tell if they've lost the game" do
		player_1.ships.delete_if { |i| !player_1.ships.empty? }
		expect(player_1.dead?).to be true
	end

	it "can tell if they're still in the game" do
		expect(player_1.dead?).to be false
	end

end