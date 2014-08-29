module CoordinateAdapter

	def to_y(letter)
		("A".."Z").to_a.index(letter.upcase)
	end

	def to_x(number)
		number - 1
	end

	def return_array(letter, number)
		[to_x(number), to_y(letter)]
	end

	def extract_letter(coordinate)
		coordinate[/[a-zA-Z]/]
	end

	def extract_number(coordinate)
		coordinate[/\d{1,2}/].to_i
	end

	def discard(coordinate)
		coordinate.split(//).delete_if { |char| char[/\W/] }.join
	end

	def convert(input)
		letter = extract_letter(discard(input))
		number = extract_number(discard(input))
		return_array(letter, number)
	end

end