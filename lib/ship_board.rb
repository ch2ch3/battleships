require_relative 'placement_rules'

class ShipBoard

	attr_accessor :grid, :dimensionality, :cardinality

	def initialize(dimensionality, cardinality)
		@grid = n_dimensional_array(dimensionality, cardinality)
	end

	def place(ship)
		PlacementRules.obey?(ship, self)
		coords = ship.coordinates.dup
		orientation = ship.orientation
		ship.elements.each do |element|
			set_cell(coords, element)
			coords[orientation] += 1
		end
	end

	def hit_at?(coordinates)
		return false if cell(coordinates).nil?
		cell(coordinates).hit!
	end

	def cell(coordinates)
		coordinate_converter(coordinates, @grid)
	end

	def set_cell(coordinates, object)
		coords = coordinates.dup
		final_coord = coords.pop
		last_array = coordinate_converter(coords, @grid)
		last_array[final_coord] = object
	end

	def n_dimensional_array(dimensionality, cardinality)
		return Array.new(cardinality) if dimensionality == 1
		dimensionality = dimensionality - 1
		Array.new(cardinality) { n_dimensional_array(dimensionality, cardinality) }
	end

	def coordinate_converter(coordinates, array)
		coordinates = coordinates.dup
		raise if coordinates.length > dimensions
		raise if coordinates.any? {|coordinate| coordinate > array.length}
		return array if coordinates.empty?
		current = coordinates.shift
		coordinate_converter(coordinates, array[current])
	end

	def dimensions(array=@grid)
		return 0 unless array.is_a?(Array)
		return 1 + dimensions(array[0])
	end

	def extension(array=@grid)
		array.length
	end

end
