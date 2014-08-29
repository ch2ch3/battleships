require "./lib/game"
require "./lib/board_builder"
require "./lib/coordinate_adapter"

include CoordinateAdapter

system "clear" or system "cls"

puts "              ``                                           "
puts "               `                                           "
puts "               `                                           "
puts "               #                                           "
puts "               '` `'  ``                                   "
puts "              @#. `@`                                      "
puts "              ##: ;'```                                    "
puts "              ##`.@@#@@                                :,@."
puts "             .#@#@#@@@@:#+.,`                          `   "
puts " ::::::::::@;:#@@@@@@@@:@+:@@,:::@@##@+::::::::::::::;     "
puts "  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#      "
puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`      "
puts "  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       "
puts "              TEAM YARRRRSPEC PRESENTS:                    "
puts "                                                           "
puts "                   BATTLESHIPS                             "
puts ""
puts ""
puts ""
puts ""

sleep(3)
system "say Welcome to Battleships"
system "clear" or system "cls"

game = Game.new
game.create_boards
game.assign_boards
game.build_fleets

p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
p2_shipboard = BoardBuilder.new(game.player_2.ship_board)
p1_firingboard = BoardBuilder.new(game.player_1.firing_board)
p2_firingboard = BoardBuilder.new(game.player_2.firing_board)

puts "Welcome to Battleships"

sleep(1)

puts "Press ENTER key to continue"
gets.chomp
sleep(0.5)
puts "PLACEMENT PHASE"
puts "==============="
puts ""
puts "In the placement phase, you will have to place your fleet on a 10x10 grid, which looks like this:"
puts p1_shipboard
sleep(3)

puts "Players, here is a list of your ships, and their length to help you place them:"
sleep(3)
puts ""
puts "Aircraft carrier - length: 5"
puts "Battleship - length: 4"
puts "Destroyer - length: 3"
puts "Submarine - length: 3"
puts "Patrol boat - length: 2"
sleep(1)
puts ""
puts "Ships can be placed horizontally or vertically"
sleep(1.5)
puts ""
puts "Are you ready? Player 1, place your ships!"
sleep (1)


# PLAYER1 PLACEMENT PHASE LOCATION MARK1

puts "Player 1, here is your aircraft carrier. Please provide the coordinates for the front of the boat:"
puts "(for example: B1, or F6)"
game.current_player.fleet[0].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
gets.chomp.to_i == 2 ? game.current_player.fleet[0].orientation=(:vertical) : game.current_player.fleet[0].orientation=(:horizontal)
p game.current_player.fleet[0]
puts "IS THIS GAME BORKED"

game.current_player.ship_board.place(game.current_player.fleet[0])

p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
system "clear" or system "cls"

puts p1_shipboard



puts "Here is your battleship (length 4):"
game.current_player.fleet[1].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
gets.chomp.to_i == 2 ? game.current_player.fleet[1].orientation=(:vertical) : game.current_player.fleet[1].orientation=(:horizontal)
game.current_player.ship_board.place(game.current_player.fleet[1])
p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
system "clear" or system "cls"

puts p1_shipboard





puts "Here is your destroyer (length 3):"
game.current_player.fleet[2].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
gets.chomp.to_i == 2 ? game.current_player.fleet[2].orientation=(:vertical) : game.current_player.fleet[2].orientation=(:horizontal)
game.current_player.ship_board.place(game.current_player.fleet[2])
p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
system "clear" or system "cls"

puts p1_shipboard




puts "Here is your submarine (length 3):"
game.current_player.fleet[3].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
game.current_player.fleet[3].orientation=(:vertical) if gets.chomp.to_i == 2
game.current_player.ship_board.place(game.current_player.fleet[3])
p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
system "clear" or system "cls"

puts p1_shipboard
puts "Here is your patrol boat (length 2):"
game.current_player.fleet[4].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
game.current_player.fleet[4].orientation=(:vertical) if gets.chomp.to_i == 2
game.current_player.ship_board.place(game.current_player.fleet[4])
p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
system "clear" or system "cls"
puts "Thank you. Player 2, your turn!"

game.change_turn

#PLAYER 2 PLACEMENT PHASE MARK2 

puts ""
puts ""
puts "Player 2, here is your aircraft carrier (length: 5). Please provide the coordinates for the front of the boat:"
puts "(for example: B1, or F6)"
game.current_player.fleet[0].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
gets.chomp.to_i == 2 ? game.current_player.fleet[0].orientation=(:vertical) : game.current_player.fleet[0].orientation=(:horizontal)
#p game.current_player.fleet[0]

#game.current_player.ship_board.place(game.current_player.fleet[0])

p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
system "clear" or system "cls"

puts p1_shipboard
puts "Here is your battleship (length 4):"
game.current_player.fleet[1].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
gets.chomp.to_i == 2 ? game.current_player.fleet[1].orientation=(:vertical) : game.current_player.fleet[1].orientation=(:horizontal)
game.current_player.ship_board.place(game.current_player.fleet[1])
p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
system "clear" or system "cls"

puts p1_shipboard
puts "Here is your destroyer (length 3):"

game.current_player.fleet[2].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
gets.chomp.to_i == 2 ? game.current_player.fleet[2].orientation=(:vertical) : game.current_player.fleet[2].orientation=(:horizontal)
game.current_player.ship_board.place(game.current_player.fleet[2])
p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
system "clear" or system "cls"

puts p1_shipboard
puts "Here is your submarine (length 3):"
game.current_player.fleet[3].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
game.current_player.fleet[3].orientation=(:vertical) if gets.chomp.to_i == 2
game.current_player.ship_board.place(game.current_player.fleet[3])
p1_shipboard = BoardBuilder.new(game.player_1.ship_board)
system "clear" or system "cls"

puts p1_shipboard
puts "Here is your patrol boat (length 2):"
game.current_player.fleet[4].placement_coordinates(convert(gets.chomp))
puts "Please provide a ship orientation:"
puts "1. Horizontal"
puts "2. Vertical"
game.current_player.fleet[4].orientation=(:vertical) if gets.chomp.to_i == 2
game.current_player.ship_board.place(game.current_player.fleet[4])
p1_shipboard = BoardBuilder.new(game.player_1.ship_board)







