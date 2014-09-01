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
    fire_coord = convert(gets.chomp)
    @game.current_player.firing_board.fire_at(fire_coord)
    puts @game.current_player.firing_board.status(fire_coord) == :hit ? "It's a hit!" : "It's a miss!"
    sleep(1)
  end

  def report_and_update
    @game.current_player.fleet.each do |ship| 
      if ship.sunk?
        puts "You sunk my #{ship.class.to_s.downcase}!"
        system "say You sunk my #{ship.class.to_s.downcase}!"
        sleep(1.0)
      end
    end
    @game.current_player.update_fleet 
  end
end
