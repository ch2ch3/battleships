require 'ship_subclass'
require_relative 'ship_spec'


describe Carrier do

  it_behaves_like "a ship"

  let(:ship_element)        { double :ship_element                   }
  let(:ship_element_class)  { double :ShipElement, new: ship_element }
  let(:carrier)             { Carrier.new(ship_element_class)        }

  it 'initializes with the correct number of ship elements for its type' do
  	expect(carrier.length).to eq(Carrier::SIZE)
  end

  it 'can tell you how long it is' do
  	expect(carrier.length).to be(5)
  end

end

describe BattleShip do

  it_behaves_like "a ship"

  let(:ship_element)        { double :ship_element                   }
  let(:ship_element_class)  { double :ShipElement, new: ship_element }
  let(:battle_ship)         { BattleShip.new(ship_element_class)     }

  it 'initializes with the correct number of ship elements for its type' do
    expect(battle_ship.length).to eq(BattleShip::SIZE)
  end

  it 'can tell you how long it is' do
    expect(battle_ship.length).to be(4)
  end
  
end

describe Destroyer do

  it_behaves_like "a ship"

  let(:ship_element)        { double :ship_element                   }
  let(:ship_element_class)  { double :ShipElement, new: ship_element }
  let(:destroyer)           { Destroyer.new(ship_element_class)      }

  it 'initializes with the correct number of ship elements for its type' do
    expect(destroyer.length).to eq(Destroyer::SIZE)
  end

  it 'can tell you how long it is' do
    expect(destroyer.length).to be(3)
  end
  
end

describe Submarine do

  it_behaves_like "a ship" 

  let(:ship_element)        { double :ship_element                   }
  let(:ship_element_class)  { double :ShipElement, new: ship_element }
  let(:submarine)           { Submarine.new(ship_element_class)      }

  it 'initializes with the correct number of ship elements for its type' do
    expect(submarine.length).to eq(Submarine::SIZE)
  end

  it 'can tell you how long it is' do
    expect(submarine.length).to be(3)
  end

end

describe PatrolBoat do

  it_behaves_like "a ship" 

  let(:ship_element)        { double :ship_element                   }
  let(:ship_element_class)  { double :ShipElement, new: ship_element }
  let(:patrol_boat)         { PatrolBoat.new(ship_element_class)     }

  it 'initializes with the correct number of ship elements for its type' do
    expect(patrol_boat.length).to eq(PatrolBoat::SIZE)
  end

  it 'can tell you how long it is' do
    expect(patrol_boat.length).to be(2)
  end
  
end
