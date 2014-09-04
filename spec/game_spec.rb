require 'game'

describe Game do

	let(:game) { Game.new }
  let(:player_1) { double :player }
  let(:player_2) { double :player }


	it 'initializes with the ability to hold players' do
		expect(game.players.class).to be (Array)
	end

  it 'can add players' do
    game.add_player(player_1)
    expect(game.players.count).to be (1)
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
	    expect(game.player_1.ship_board).to be(game.player_2.firing_board.linked_ship_board)
	end

	it 'makes sure that each player has a different shipboard' do
		game.create_boards
      	game.assign_boards
      	expect(game.player_1.ship_board).not_to be(game.player_2.ship_board)
  end

	it 'provides each player with all their ships' do
		game.build_fleets
		expect(game.player_1.fleet.count).to eq(5)
		expect(game.player_2.fleet.count).to eq(5)
		expect(game.player_1.fleet[0].class).to eq(Carrier)
	end

	

end

