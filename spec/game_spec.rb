require 'game'

describe Game do

  let(:player_1) { Player.new }
  let(:player_2) { Player.new }
  #let(:player_1) { double :player, :firing_board => nil, :firing_board= => nil, :fleet => nil }
  #let(:player_2) { double :player, :firing_board => nil, :firing_board= => nil }
	let(:game) { Game.new }

  def add_players(game)
    game.players << player_1
    game.players << player_2
  end

	it 'initializes with the ability to hold players' do
		expect(game.players.class).to be (Array)
	end

  it 'can add players' do
    game.add_player(player_1)
    expect(game.players.count).to be (1)
  end

	it 'knows whose turn it is' do
    add_players(game)
		expect(game.respond_to?(:current_player)).to be true
	end

	it 'can change whose turn it is' do
    add_players(game)
		game.change_turn
		expect(game.current_player).to eq(player_2)
		game.change_turn
		expect(game.current_player).to eq(player_1)
	end

	it 'initializes all the appropriate boards' do
      add_players(game)
	    game.create_boards
      game.assign_boards
	    expect(game.players[0].ship_board.class).to eq(ShipBoard)
	    expect(game.players[1].ship_board.class).to eq(ShipBoard)
	    expect(game.players[0].firing_board.class).to eq(FiringBoard)
	    expect(game.players[1].firing_board.class).to eq(FiringBoard)
	end

	it 'provides each player with the correct boards' do
      add_players(game)
	    game.create_boards
      game.assign_boards
	    expect(game.players[0].ship_board).to be(game.players[1].firing_board.linked_ship_board)
	end

	it 'makes sure that each player has a different shipboard' do
      add_players(game)
      game.create_boards
      game.assign_boards
      expect(game.players[0].ship_board).not_to be(game.players[1].ship_board)
  end

	it 'provides each player with all their ships' do
    add_players(game)
		game.build_fleets
		expect(game.current_player.fleet.count).to eq(5)
		expect(game.players[0].fleet[0].class).to eq(Carrier)
    game.change_turn
		expect(game.players[0].fleet.count).to eq(5)
	end

	

end

