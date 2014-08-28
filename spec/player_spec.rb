require 'player'
require 'ship' #let's try and get rid of this

describe Player do

	let(:player_1) { Player.new }

	it "should be able to hold fleet" do
		expect(player_1.fleet.class).to eq Array
	end

	it "can build and hold all the fleet" do
		player_1.build_fleet
		p player_1.fleet
		expect(player_1.fleet.count).to eq (5)
	end

	it "initializes with all their fleet" do
		expect(player_1.fleet.count).to eq (5)
	end

	it "can tell if they've lost the game" do
		player_1.fleet.delete_if { |i| !player_1.fleet.empty? }
		expect(player_1.dead?).to be true
	end

	it "can tell if they're still in the game" do
		expect(player_1.dead?).to be false
	end

	it "can remove fleet if they've been sunk" do
		expect(player_1.fleet[2]).to receive(:sunk?).and_return(true)
		player_1.update_fleet
		expect(player_1.fleet.count).to eq (4)
	end

end