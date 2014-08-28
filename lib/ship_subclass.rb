require 'ship'


 class Carrier < Ship 

  SIZE = 5

  def initialize(ship_element)
    super
    build(ship_element)
  end

  def build(ship_element)
    SIZE.times { elements << ship_element.new } 
  end

 end


 class BattleShip  < Ship 

  SIZE = 4

  def initialize(ship_element)
    super
    build(ship_element)
  end

  def build(ship_element)
    SIZE.times { elements << ship_element.new } 
  end
  
 end


 class Destroyer < Ship 

  SIZE = 3

  def initialize(ship_element)
    super
    build(ship_element)
  end

  def build(ship_element)
    SIZE.times { elements << ship_element.new } 
  end

end

 class Submarine < Ship 

  SIZE = 3

  def initialize(ship_element)
    super
    build(ship_element)
  end

  def build(ship_element)
    SIZE.times { elements << ship_element.new } 
  end

 end

 class PatrolBoat < Ship 

  SIZE = 2

  def initialize(ship_element)
    super
    build(ship_element)
  end

  def build(ship_element)
    SIZE.times { elements << ship_element.new } 
  end
 
end
