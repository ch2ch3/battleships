require 'player'

describe Player do

	let(:player_1)  { Player.new                      }
	let(:carrier)	{ double :carrier, sunk?: true    }
	let(:submarine) { double :submarine, sunk?: false }
	let(:destroyer) { double :destroyer, sunk?: false }

	def fill_fleet
		player_1.fleet << carrier
		player_1.fleet << submarine
		player_1.fleet << destroyer
	end

	it "should be able to hold fleet" do
		expect(player_1.fleet.class).to eq Array
	end

	it "can tell if they've lost the game" do
		fill_fleet
		player_1.fleet.delete_if { |i| !player_1.fleet.empty? }
		expect(player_1.dead?).to be true
	end

	it "can tell if they're still in the game" do
		fill_fleet
		expect(player_1.dead?).to be false
	end

	it "can remove fleet if they've been sunk" do
		fill_fleet
		player_1.update_fleet
		expect(player_1.fleet.count).to eq (2)
	end

end