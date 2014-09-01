class PlacementError < StandardError
end

module PlacementRules

	def self.obey?(ship, placement_grid)
		x, y = ship.x_coordinate, ship.y_coordinate
		if ship.orientation == :vertical
			raise PlacementError if ship.length > (placement_grid.grid.length - x)
			raise PlacementError unless row_empty?(ship, x, y, placement_grid)
		elsif ship.orientation == :horizontal
			raise PlacementError if ship.length > (placement_grid.grid[x].length - y)
			raise PlacementError unless column_empty?(ship, x, y, placement_grid)
    	end
	end

	def self.row_empty?(ship, x, y, placement_grid)
			(x..(x + ship.length)).
				all? {|x_coord| placement_grid.cell(x_coord, y) == nil}
	end

	def self.column_empty?(ship, x, y, placement_grid)
			(y..(y + ship.length)).
				all? {|y_coord| placement_grid.cell(x, y_coord) == nil}
	end

end


