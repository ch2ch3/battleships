require 'terminal-table'

class GridBuilder

	attr_accessor :grid

	def initialize(input)
		input.map! do |row|
			row.map! do |cell|
				if cell == :hit
					"\033[31mX\033[0m"
				elsif cell == :miss
					"O"
				else
					"\033[34m~\033[0m"
				end
			end
		end
		@grid = Terminal::Table.new :rows => input
	end

	def to_s
		@grid.to_s
	end

end