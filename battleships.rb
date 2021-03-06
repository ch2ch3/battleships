require "pry"
require "./lib/game"
require "./lib/board_builder"
require "./lib/battleships_controller"
require "./lib/coordinate_adapter"

include GameController
include CoordinateAdapter

clear_screen

display_logo
sleep(3)
system "say Welcome to Battleships"

clear_screen

game_create

puts "Welcome to Battleships"

sleep(1)

puts "Press ENTER key to continue"
gets.chomp
sleep(0.5)
puts "PLACEMENT PHASE"
puts "==============="
puts ""
puts "In the placement phase, you will have to place your fleet on a 10x10 grid, which looks like this:"

display_board(:ship_board)
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
clear_screen
puts display_board(:ship_board)
sleep (1)

@game.players.count.times do @game.current_player.fleet.each do |ship|
  begin
  puts "Here is your #{ship.class.to_s.downcase} (length: #{ship.length}). Please provide the coordinates for the front of the boat:"
  puts "(for example: B1, or F6)"
    begin
    locate_ship(ship)
    rescue CoordinateError => e
      puts e.message
      retry
    rescue
      puts "Invalid input, please try again"
      retry
    end
    puts "Please provide a ship orientation:"
    puts "1. Horizontal"
    puts "2. Vertical"
    begin
    orient_ship(ship)
    rescue 
      puts "Invalid input, please try again"
      retry
    end
    place_ship(ship)
    rescue PlacementError
      puts "Invalid placement, please try again"
      retry
    rescue
      puts "Invalid input, please try again"
      retry
    end
    clear_screen
    puts display_board(:ship_board)
  end
  clear_screen
  @game.change_turn
  puts "Player 2! Your turn" if @game.current_player == @game.player_2
  puts display_board(:ship_board)
end

puts "Ok! Let's sink some ships!"
loop do
  clear_screen
  puts @game.current_player == @game.player_1 ? "Player 1: your turn" : "Player 2: your turn"
  puts "Your opponent's ships:"
  puts display_board(:firing_board)
  puts "Your ships:"
  puts display_board(:ship_board)
  if @game.current_player == @game.player_1 
    puts "Player 1! FIRE!" 
    else puts "Player 2! FIRE!"
    end
  puts "Please provide the coordinates of where you would like to fire:"
  puts "(e.g. B6, F10)"
  begin
  puts fire
  rescue FiringError => e
    puts e.message
    retry
  rescue CoordinateError => e
    puts e.message
    retry
  rescue 
    puts "Invalid input, please try again"
    retry
  end
  sleep(0.75)
  @game.change_turn
  report_and_update
  break if @game.current_player.dead?
end

puts "Congratulations! You win!"
system "say Congratulations! You win!"
