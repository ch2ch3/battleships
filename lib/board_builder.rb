require 'terminal-table'
require 'colorize'

class BoardBuilder

	attr_accessor :board

	def initialize(input)
		if input.class == FiringBoard
			board_image = input.grid
			@table = firing_board_array_to_image(board_image)
		elsif input.class ShipBoard
			board_image = input.grid
			@table = ship_board_array_to_image(board_imageimage)
		end
	end

	def to_s
		@image.to_s
	end

	def firing_board_array_to_image(array)

		array.map! do |row|
			row.map! do |cell|
				if cell == :hit
					"X".colorize(:red)
				elsif cell == :miss
					"O"
				else
					"~".colorize(:blue)
				end
			end
		end

	end

end