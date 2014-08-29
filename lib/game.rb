require_relative 'player'
require_relative 'firing_board'
require_relative 'ship_board'
require_relative 'ship_subclass'
require_relative 'ship_element'

class Game

	attr_reader :player_1, :player_2, :players, :current_player

	DEFAULT_BOARD_DIMENSION = 10
  SHIPS = [Carrier, BattleShip, Destroyer, Submarine, PatrolBoat]

	def initialize
		@player_1 = Player.new
		@player_2 = Player.new
		@players = [@player_1, @player_2]
		@current_player = @player_1
	end

	def change_turn
		@current_player = players.rotate![0]
	end

	def create_boards(x: DEFAULT_BOARD_DIMENSION, y: DEFAULT_BOARD_DIMENSION)
	    players.each do |player|
			player.firing_board=(FiringBoard.new(x, y, ShipBoard.new(x, y)))
		end
  end

  def assign_boards
		players.each do |player|
			(1..players.size).each do |number|
				player.ship_board = players[-1].firing_board.linked_ship_board
			end
		end
	end

	def build_fleets
		players.each do |player|
			SHIPS.each { |ship| player.fleet << ship.new(ShipElement) }
		end
	end

end
