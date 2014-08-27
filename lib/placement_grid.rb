class PlacementGrid

	def initialize(x,y)
		@grid = Array.new(x) { Array.new(y) }
	end

	def place(ship, x, y, orientation=:horizontal)
		ship_dont_fit?(ship, x, y, orientation)
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
		raise (ArgumentError) unless @grid[x][y].nil?
		if orientation == :horizontal
			raise (ArgumentError) if ship.elements.count > (@grid.length - x)
		elsif orientation == :vertical
			raise(ArgumentError) if ship.elements.count > (@grid[x].length - y)
		end
	end

	def hit_at?(x,y)
		return false if @grid[x][y].nil?
		@grid[x][y].hit!
	end

	def cell(x, y)
		@grid[x][y]
	end

end