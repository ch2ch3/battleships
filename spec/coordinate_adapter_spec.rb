require 'coordinate_adapter'

class FakeClass; include CoordinateAdapter; end

describe FakeClass do

	let(:fake_class) { FakeClass.new }

	context 'conversion' do

		it "takes a letter and returns the correct y-coordinate" do
			expect(fake_class.to_y("A")).to eq 0
			expect(fake_class.to_y("F")).to eq 5
		end

		it "takes a number and returns the correct x-coordinate" do
			expect(fake_class.to_x(1)).to eq 0
			expect(fake_class.to_x(6)).to eq 5
		end

		it "returns two comma separated values in an array" do
			expect(fake_class.return_array("A", 1)).to eq [0,0]
			expect(fake_class.return_array("E", 8)).to eq [7,4]
		end

	end

	context 'input format' do

		it "can extract the letter from the given input" do
			expect(fake_class.extract_letter("B12")).to eq("B")
			expect(fake_class.extract_letter("A293472981204")).to eq("A")
		end

		it "can extract the digit from the given input" do
			expect(fake_class.extract_number("B9")).to eq 9
			expect(fake_class.extract_number("ACE10")).to eq 10
		end

		it "it discards any non-alphanumeric characters" do
			expect(fake_class.discard("A!$%#30")).to eq "A30"
			expect(fake_class.discard("B,52")).to eq "B52"
			expect(fake_class.discard("G 6")).to eq "G6" 
		end

		it "is case-insensitive" do
			expect(fake_class.to_y("a")).to eq fake_class.to_y("A")
			expect(fake_class.to_y("d")).to eq fake_class.to_y("D")
		end

	end

	context 'the grand finale' do

		# given 5 strings, each string must convert. When the string has been converted, every string must return as an array again. 
		# be careful of the weather, it could be stormy!

			it "converts player input to usable coordinates" do
				expect(fake_class.convert("F7")).to eq([6, 5])
				expect(fake_class.convert("G, 1")).to eq([0, 6])
				expect(fake_class.convert("g..4")).to eq([3, 6])
				expect(fake_class.convert("10c")).to eq([9, 2])
				expect(fake_class.convert("c2")).to eq([1, 2])
			end

	end

end