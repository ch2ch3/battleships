require 'player'
require 'ship'
require 'firing_board'
require 'ship_board'

class Game

	attr_reader :player_1, :player_2, :players, :current_player

	DEFAULT_GRID_DIMENSION = 10

	def initialize
		@player_1 = Player.new
		@player_2 = Player.new
		@players = [@player_1, @player_2]
		@current_player = @player_1
	end

	def change_turn
		@current_player = players.reverse![0]
	end

  def create_grids(x: DEFAULT_GRID_DIMENSION, y: DEFAULT_GRID_DIMENSION)
    players.each do |player|
			player.firing_board=(FiringBoard.new(x, y, ShipBoard.new(x, y)))
    end

	@player_1.ship_board = @player_2.firing_board.linked_ship_board
	@player_2.ship_board = @player_1.firing_board.linked_ship_board
  end

end
