class Ship

	attr_reader :elements, :type, :x_coordinate, :y_coordinate
	attr_accessor :orientation

	def initialize(ship_elements)
		@elements = []
		@x_coordinate = nil
		@y_coordinate = nil
		@orientation = nil
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

	#def build(size, ship_part)
    #size.times { elements << ship_part.new }
	#end

end
