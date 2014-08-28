require 'player'
require 'ship'
require 'tracking_grid'
require 'placement_grid'

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
		@current_player = players.push(players.shift)[0]
	end

  def create_grids(x: DEFAULT_GRID_DIMENSION, y: DEFAULT_GRID_DIMENSION)
    players.each do |player|
			player.tracking_grid=(TrackingGrid.new(x, y, PlacementGrid.new(x, y)))
    end
		@player_2.placement_grid = @player_1.tracking_grid.placement_grid
		@player_1.placement_grid = @player_2.tracking_grid.placement_grid
  end

end
