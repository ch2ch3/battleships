require_relative 'placement_rules'

class ShipBoard

	attr_reader :grid

	def initialize(dimensionality, cardinality)
		@grid = n_dimensional_array(dimensionality, cardinality)
	end

	def place(ship)
		 PlacementRules.obey?(ship, self)
		x, y = ship.x_coordinate, ship.y_coordinate
		ship.elements.each do |element|
			@grid[x][y] = element
			ship.orientation == :vertical ?  x += 1 : y += 1
			end
		self
	end

	def hit_at?(x, y)
		return false if @grid[x][y].nil?
		@grid[x][y].hit!
	end

	def cell(x, y)
		@grid[x][y]
	end

	def n_dimensional_array(dimensionality, cardinality)
		return Array.new(cardinality) if dimensionality == 1
		dimensionality = dimensionality - 1
		Array.new(cardinality) { n_dimensional_array(dimensionality, cardinality) }
	end

end
