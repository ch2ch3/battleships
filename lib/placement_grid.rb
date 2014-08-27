class PlacementError < StandardError
end

class PlacementGrid

	attr_reader :grid

	def initialize(x,y)
		@grid = Array.new(x) { Array.new(y) }
	end

	def place(ship)
		does_ship_fit?(ship)
		x, y = ship.x_coordinate, ship.y_coordinate
		ship.elements.each do |element|
			@grid[x][y] = element
			ship.orientation == :horizontal ?  x += 1 : y += 1
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

	def does_ship_fit?(ship)
		x, y = ship.x_coordinate, ship.y_coordinate
		if ship.orientation == :horizontal
			raise PlacementError if ship.length > (@grid.length - x)
			raise PlacementError unless row_empty?(ship, x, y)
		elsif ship.orientation == :vertical
			raise PlacementError if ship.length > (@grid[x].length - y)
			raise PlacementError unless column_empty?(ship,x,y)
		end
	end

	def row_empty?(ship, x, y)
			(x..(x + ship.length)).
				all? {|x_coord| cell(x_coord, y) == nil}
	end

	def column_empty?(ship, x, y)
			(y..(y + ship.length)).
				all? {|y_coord| cell(x, y_coord) == nil}
	end

end