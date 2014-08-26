class TrackingGrid

	attr_reader :dimensions, :placement_grid

	def initialize(x,y, placement_grid)
		@dimensions = [x,y]
		@grid = Array.new(x) { Array.new(y) }
		@placement_grid = placement_grid
	end

	def fire_at(x,y)
		raise "You've already fired here!" if coordinate_fired_at?(x,y)
		@grid[x][y] = (placement_grid.hit_at?(x,y) ? :hit : :miss)
		self
	end

	def coordinate_fired_at?(x,y)
		not @grid[x][y].nil?
	end

	def status(x,y)
		@grid[x][y]
	end

end