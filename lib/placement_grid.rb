class PlacementGrid

	def initialize(x,y)
		@grid = Array.new(x) { Array.new(y) }
	end

	def place(ship, x, y, orientation=:horizontal)
		raise(ArgumentError, "Ship don't fit yo!") if ship_dont_fit?(ship, x, y, orientation)

		ship.elements.each do |element|
			@grid[x][y] = element
			if orientation == :horizontal
				x += 1
			else
				y += 1
			end
		end
		self
	end

	def ship_dont_fit?(ship, x, y, orientation)
		return true unless @grid[x][y].nil?
		return true if ship.elements.count > x
		if orientation == :horizontal
			return true if ship.elements.count > (@grid.length - x)
		end
	end

end