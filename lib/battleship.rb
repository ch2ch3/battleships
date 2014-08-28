class Battleship < Ship

	SIZE = 4

	def initialize
		super
		build
	end

	def build
		SIZE.times { @elements << ShipElement.new }
	end

	def size
		SIZE
	end

end