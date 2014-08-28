require 'terminal-table'
require 'colorize'

class BoardBuilder

	attr_accessor :board

	HEADINGS = [" "] + ("A".."J").to_a

	def initialize(input)
		table = []
		if input.class == FiringBoard
			board_image = input.grid
			table = firing_board_array_to_image(board_image)
		elsif input.class == ShipBoard
			board_image = input.grid
			table = ship_board_array_to_image(board_image)
		end
		@image = Terminal::Table.new :headings => HEADINGS, :rows => table
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
			row.unshift(array.index(row)+1)
		end

	end

	def ship_board_array_to_image(array)

		array.map! do |row|
			row.map! do |cell|
				if cell.class == ShipElement
					if cell.hit
						"∆".yellow.on_red.blink
					else
						"∆".colorize(:light_black).colorize(:background => :blue)
					end
				else
					"~".colorize(:blue)
				end
			end
			row.unshift(array.index(row)+1)
		end
	end

end