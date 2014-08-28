class Carrier < Ship

	SIZE = 5

	def initialize(ship_elements)
		super
		build(ship_elements)
	end

	def build(ship_elements)
		SIZE.times { elements << ship_elements }
	end
	
	def size
		SIZE
	end
	
end
