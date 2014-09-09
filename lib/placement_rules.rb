class PlacementError < StandardError
end

module PlacementRules

	def self.obey?(ship, placement_grid)
		coordinates = ship.coordinates.dup
		orientation = ship.orientation
		raise PlacementError unless length_fits_on_grid?(ship, placement_grid)
		ship.elements.each do |element|
			raise PlacementError unless placement_grid.cell(coordinates).nil?
			coordinates[orientation] += 1
		end
	end

	def self.length_fits_on_grid?(ship, grid)
		(ship.coordinates[ship.orientation] + ship.length) <= grid.extension
	end


end


