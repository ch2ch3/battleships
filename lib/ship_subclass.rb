require 'ship'

class Carrier < Ship

	SIZE = 5

	def initialize(ship_element)
		super
		super build(SIZE, ship_element)
	end

end

class BattleShip  < Ship

	SIZE = 4

	def initialize(ship_element)
		super
		super build(SIZE, ship_element)
	end

end

class Destroyer < Ship

	SIZE = 3

	def initialize(ship_element)
		super
		super build(SIZE, ship_element)
	end
end

class Submarine < Ship

	SIZE = 3

	def initialize(ship_element)
		super
		super build(SIZE, ship_element)
	end
end

class PatrolBoat < Ship

	SIZE = 2

	def initialize(ship_element)
		super
		super build(SIZE, ship_element)
	end
end
