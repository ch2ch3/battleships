class Player

	attr_reader :ships
  attr_accessor :placement_grid, :tracking_grid

	def initialize
		build_ships
		@ships = [@carrier, @battleship, @submarine, @destroyer, @patrol_boat]
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
