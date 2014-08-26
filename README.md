Battleships
===========

Ethel, Andy, Spike and Dave set sail for adventure on the week 4 task at Makers, creating the game of Battleships.

Version 0 - Domain Model
------------------------

Our model for Battleships consists of the following elements:

- Ships
- Ship elements (the individual parts of the ship)
- Placement grid (the open sea!)
- Tracking grid (tracking thr shots fired by...)
- The player
- A score board

During gameplay, the elements will interact in the following way:

- The player will tell the tracking grid that it is firing at a grid
	coordinate.
- The tracking grid will then tell the placement grid that the coordinate has been.
	fired at
- The placement grid will then check that location for a ship element; if none
	is fired it returns a 'miss' message to the tracking grid, which logs the
	coordinate as a 'miss'.
- If a ship element is present, it tells its parent ship that it has been
	hit and sets its status to hit.
- The ship checks whether it has been destroyed by seeing if any of its elements
	are still un-hit; if it has it sends the appropriate message ("You've sunk my
	battleship") and updates the scores.  Otherwise it does nothing.
- In either case the placement grid tells the tracking grid that the coordinate
	was a hit.
- And the tracking grid updates to show that coordinate as a 'hit'.
- The game is over when all of a player's ships have reported themselves as
	destroyed to the score board.

During placement

- The player places a ship
- This is interpreted as a message to the ship stating the starting coordinate
	('a1') and its direction ('horizontal' or 'vertical').
- The ship passes its ship elements as well as the start coordinate and
	direction to the placement grid.
- The placement grid translates this to a series of coordinates. If any of those
	coordinates are already filled, or are beyond the bounds of the grid it
	returns an error.
- Otherwise the ship elements are placed at the appropriate coordinates on the
	placement grid.

 |Object name | Responsibility |
 ------------------------------
 |Tracking grid | Tracking shots |
 |Placement grid | Location of ship elements |
 |Ship element | Knowing if it has been hit or not |
 |Ship | Knowing if all of its ship elements are destroyed |
 |Scoreboard | Knowing when the game ends |
 -----------------------------
