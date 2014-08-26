require './lib/ship_element'

class Ship

	JANES_FIGHTING_SHIPS = {
		carrier: 5,
		battleship: 4,
		submarine: 3,
		destroyer: 3,
		patrol_boat: 2,
		ship: 1
	}

	attr_reader :elements, :type

	def initialize(type)
		@elements = []
		@type = type
		build
	end

	def give(element)
		@elements << element
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
end