class FiringBoard

	attr_reader :dimensions

	def initialize(x,y, placement_grid)
		@grid = Array.new(x) { Array.new(y) }
		@placement_grid = placement_grid
	end

	def linked_ship_board
		@placement_grid
	end

	def fire_at(x,y)
		raise "You've already fired here!" if coordinate_fired_at?(x,y)
		@grid[x][y] = (linked_ship_board.hit_at?(x,y) ? :hit : :miss)
		self
	end

	def coordinate_fired_at?(x,y)
		not @grid[x][y].nil?
	end

	def status(x,y)
		@grid[x][y]
	end

end