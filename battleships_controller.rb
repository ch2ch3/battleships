require "./lib/game"
require "./lib/board_builder"
require "./lib/coordinate_adapter"
require 'pry'

module GameController

include CoordinateAdapter

def clear_screen
  system "clear" or system "cls"
end

def display_logo
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
end

def game_create
  @game = Game.new
  @game.create_boards
  @game.assign_boards
  @game.build_fleets
end

def display_board(board)
  puts BoardBuilder.new(@game.current_player.ship_board) if board == :ship_board
  puts BoardBuilder.new(@game.current_player.firing_board) if board == :firing_board
end

def locate_ship(ship)
  ship.placement_coordinates(convert(gets.chomp))
end

def orient_ship(ship)
  gets.chomp.to_i == 2 ? ship.orientation=(:vertical) : ship.orientation=(:horizontal)
end

def place_ship(ship)
  @game.current_player.ship_board.place(ship)
end

def fire
  @game.current_player.firing_board.fire_at(convert(gets.chomp))
end
end
