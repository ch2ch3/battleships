class PlacementGrid

	attr_reader :grid

	def initialize(x,y)
		@grid = Array.new(x) { Array.new(y) }
	end

	def place(ship, x, y, orientation=:horizontal)
		does_ship_fit?(ship, x, y, orientation)
		ship.elements.each do |element|
			@grid[x][y] = element
			orientation == :horizontal ?  x += 1 : y += 1
			end
		self
	end

	def does_ship_fit?(ship, x, y, orientation)
		#raise (ArgumentError) unless @grid[x][y].nil?
		if orientation == :horizontal
			raise (ArgumentError) if ship.length > (@grid.length - x)
			raise (ArgumentError) unless (x..(x + ship.length)).all? {|x_coord| cell(x_coord, y) == nil}
		elsif orientation == :vertical
			raise(ArgumentError) if ship.length > (@grid[x].length - y)
			raise (ArgumentError) unless (y..(y + ship.length)).all? {|y_coord| cell(x, y_coord) == nil}
		end
	end

	def hit_at?(x, y)
		return false if @grid[x][y].nil?
		@grid[x][y].hit!
	end

	def cell(x, y)
		@grid[x][y]
	end

end