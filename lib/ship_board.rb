require_relative 'placement_rules'
require_relative 'board'

class ShipBoard < Board

	attr_accessor :grid, :dimensionality, :cardinality

	def place(ship)
		PlacementRules.obey?(ship, self)
		coords = ship.coordinates.dup
		orientation = ship.orientation
		ship.elements.each do |element|
			set_cell(coords, element)
			coords[orientation] += 1
		end
	end

	def hit_at?(coordinates)
		return false if cell(coordinates).nil?
		cell(coordinates).hit!
	end

end
