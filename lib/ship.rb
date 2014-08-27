require './lib/ship_element'

class Ship

	JANES_FIGHTING_SHIPS = {
		carrier: 5,
		battleship: 4,
		submarine: 3,
		destroyer: 3,
		patrol_boat: 2
	}

	attr_reader :elements, :type, :x_coordinate, :y_coordinate
	attr_accessor :orientation

	def initialize(type)
		@elements = []
		@type = type
		@x_coordinate = nil
		@y_coordinate = nil
		@orientation = nil
		build
	end

	def build
		JANES_FIGHTING_SHIPS[@type].times do
			@elements << ShipElement.new
		end
	end

	def length
		@elements.length
	end

	def sunk?
		elements.all?(&:hit)
	end

	def placement_coordinates(coordinates)
		@x_coordinate = coordinates.first
		@y_coordinate = coordinates.last
	end

end