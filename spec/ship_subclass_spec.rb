require 'ship_subclass'
require_relative 'ship_spec'

describe Carrier do

  it_behaves_like "a ship" do

		it 'initializes with the correct number of ship elements for its type' do
			expect(ship.length).to eq(5)
		end

	  it 'can tell you how long it is' do
	  	expect(ship.length).to be(5)
	  end

  end

end

describe BattleShip do

  it_behaves_like "a ship" do

    it 'initializes with the correct number of ship elements for its type' do
      expect(ship.length).to eq(4)
    end

    it 'can tell you how long it is' do
      expect(ship.length).to be(4)
    end

  end
end

describe Destroyer do

  it_behaves_like "a ship" do

    it 'initializes with the correct number of ship elements for its type' do
      expect(ship.length).to eq(3)
    end

    it 'can tell you how long it is' do
      expect(ship.length).to be(3)
    end

  end
end

describe Submarine do

  it_behaves_like "a ship" do

    it 'initializes with the correct number of ship elements for its type' do
      expect(ship.length).to eq(3)
    end

    it 'can tell you how long it is' do
      expect(ship.length).to be(3)
    end

  end
end

describe PatrolBoat do

  it_behaves_like "a ship" do

    it 'initializes with the correct number of ship elements for its type' do
      expect(ship.length).to eq(2)
    end

    it 'can tell you how long it is' do
      expect(ship.length).to be(2)
    end

  end
end
