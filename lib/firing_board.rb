require_relative 'board'

class FiringBoard < Board

	attr_reader :linked_ship_board

	def initialize(ship_board)
		@depth = ship_board.depth
		@extension = ship_board.extension
		@linked_ship_board = ship_board
		@grid = n_dimensional_array(@depth, @extension)
	end

	def fire_at(coordinates)
		raise "You've already fired here!" if coordinate_fired_at?(coordinates)
		set_cell(coordinates, (linked_ship_board.hit_at?(coordinates) ? :hit : :miss))
		self
	end

	def coordinate_fired_at?(coordinates)
		not cell(coordinates).nil?
	end

	def status(coordinates)
		cell(coordinates)
	end

end
