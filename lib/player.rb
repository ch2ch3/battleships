class Player

	attr_reader :fleet
  	attr_accessor :firing_board

	def initialize
		build_fleet
		@fleet = [@carrier, @battleship, @submarine, @destroyer, @patrol_boat]
	end

	def ship_board
		@placement_grid
	end

	def ship_board=(value)
		@placement_grid = value
	end

	def build_fleet
		@carrier = Ship.new(:carrier)
		@battleship = Ship.new(:battleship)
		@submarine = Ship.new(:submarine)
		@destroyer = Ship.new(:destroyer)
		@patrol_boat = Ship.new(:patrol_boat)
	end
	
	def dead?
		fleet.empty?
	end

	def update_fleet
		fleet.reject! { |ship| ship.sunk? }
	end

end
