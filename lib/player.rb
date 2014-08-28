class Player

	attr_reader :fleet
  	attr_accessor :firing_board, :ship_board

	def initialize
		@fleet = []
	end
	
	def dead?
		fleet.empty?
	end

	def update_fleet
		fleet.reject! { |ship| ship.sunk? }
	end

end
