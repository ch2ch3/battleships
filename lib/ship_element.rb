class ShipElement

	attr_reader :hit

	def initialize
		@hit = false
	end

	def hit!
		@hit = true
	end

end