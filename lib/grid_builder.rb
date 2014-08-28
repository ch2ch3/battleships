require 'terminal-table'
require 'colorize'

class GridBuilder

	attr_accessor :grid

	def initialize(input)
		input.map! do |row|
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
		@grid = Terminal::Table.new :rows => input
	end

	def to_s
		@grid.to_s
	end

end