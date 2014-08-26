require 'ship_element'

class Ship

	BUILD_INFO = { 
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
		BUILD_INFO[@type].times do
			@elements << ShipElement.new
		end
	end

end