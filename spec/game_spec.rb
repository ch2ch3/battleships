require 'game'

describe Game do

	let(:game) { Game.new }

	it 'initializes with 2 players' do
		expect(game.players.count).to be (2)
	end

	it 'knows whose turn it is' do
		expect(game.respond_to?(:current_player)).to be true
	end

	it 'can change whose turn it is' do
		game.change_turn
		expect(game.current_player).to eq(game.player_2)
		game.change_turn
		expect(game.current_player).to eq(game.player_1)
	end

	it 'initializes all the appropriate boards' do
	    game.create_boards
      game.assign_boards
	    expect(game.player_1.ship_board.class).to eq(ShipBoard)
	    expect(game.player_2.ship_board.class).to eq(ShipBoard)
	    expect(game.player_1.firing_board.class).to eq(FiringBoard)
	    expect(game.player_2.firing_board.class).to eq(FiringBoard)
	end

	it 'provides each player with the correct boards' do
	    game.create_boards
      game.assign_boards
	    expect(game.player_1.ship_board).to eq(game.player_2.firing_board.linked_ship_board)
	end

	it 'provides each player with all their ships' do
		game.build_fleets
		expect(game.player_1.fleet.count).to eq(5)
		expect(game.player_2.fleet.count).to eq(5)
		expect(game.player_1.fleet[0].class).to eq(Carrier)
	end

	

end

