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
		fleet.each { |ship| puts "You've sunk my #{ship}!" if ship.sunk? }
		fleet.reject! { |ship| ship.sunk? }
		puts "Game over! You lose!" if dead?
	end

end
