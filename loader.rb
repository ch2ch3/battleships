require './lib/ship_element'
require './lib/ship'
require './lib/placement_grid'
require './lib/tracking_grid'


def load
	@placement_grid = PlacementGrid.new(10, 10)
	@tracking_grid = TrackingGrid.new(10, 10, @placement_grid)
	@carrier = Ship.new(:carrier)
	@battleship = Ship.new(:battleship)
	@submarine = Ship.new(:submarine)
	@destroyer = Ship.new(:destroyer)
	@patrol_boat = Ship.new(:patrol_boat)
end