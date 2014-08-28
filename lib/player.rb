class Player

	attr_reader :ships
  	attr_accessor :firing_board

	def initialize
		build_ships
		@ships = [@carrier, @battleship, @submarine, @destroyer, @patrol_boat]
	end

	def ship_board
		@placement_grid
	end

	def ship_board=(value)
		@placement_grid = value
	end

	def build_ships
		@carrier = Ship.new(:carrier)
		@battleship = Ship.new(:battleship)
		@submarine = Ship.new(:submarine)
		@destroyer = Ship.new(:destroyer)
		@patrol_boat = Ship.new(:patrol_boat)
	end
	
	def dead?
		ships.empty?
	end

	def update_ships
		ships.reject! { |ship| ship.sunk? }
	end

end
