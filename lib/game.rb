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



end