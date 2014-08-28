class Submarine < Ship

	SIZE = 3

	def initialize(ship_element_goes_here)
		super
		build(shoop)
	end

	def build(shoop)
		SIZE.times { elements << ship_element_goes_here }
	end


end