require_relative 'player'

class Game

	attr_reader :player_1, :player_2, :players, :current_player

	def initialize
		@player_1 = Player.new
		@player_2 = Player.new
		@players = [@player_1, @player_2]
		@current_player = @player_1
	end

	def change_turn
		@current_player = players.push(players.shift)[0]
	end

  #remember to link the opposing player's grid instead of the player's own
  #
  def create_grids
    players.each {|player| player.grids << PlacementGrid.new(10, 10) }
    players.each {|player| player.grids << TrackingGrid.new(10, 10, player.grids[0]) }
  end

end
