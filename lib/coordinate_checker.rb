module CoordinateChecker

	def valid?(x, y, grid)
		return false if x.class != Fixnum || y.class != Fixnum
		return false if 0 > x || grid.length < x
		return false if 0 > y || grid.first.length < y
		true
	end 

end