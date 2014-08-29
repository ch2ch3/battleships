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

	def placement_coordinates(x, y)
		@x_coordinate = x
		@y_coordinate = y
	end

  def build(ship_element)
    self.class::SIZE.times { elements << ship_element.new }
  end

end
