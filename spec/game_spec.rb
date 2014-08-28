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

	it 'initializes all the appropriate grids' do
    game.create_grids
    expect(game.player_1.ship_board.class).to eq(PlacementGrid)
    expect(game.player_2.ship_board.class).to eq(PlacementGrid)
    expect(game.player_1.firing_board.class).to eq(TrackingGrid)
    expect(game.player_2.firing_board.class).to eq(TrackingGrid)
  end

  it 'provides each player with the correct grids' do
    game.create_grids
    expect(game.player_1.ship_board).to eq(game.player_2.firing_board.linked_ship_board)
  end
end

