require 'terminal-table'
require 'colorize'

class BoardBuilder

	attr_accessor :board

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
		@board = Terminal::Table.new :rows => input
	end

	def to_s
		board.to_s
	end

end