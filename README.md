# Domino Pyramid
A simple single-player domino game built with [ruby2d](https://github.com/ruby2d/ruby2d) gem.

To launch the game install `ruby2d` gem and run `ruby main.rb`.

## Rules
Domino tiles are laid out in a pyramid, face down, except for the first and last rows which are revealed.
The goal is to remove all bones by selecting pairs whose combined value equals 12.
Clicking such a pair removes them and may reveal hidden bones underneath.
You win by clearing the entire pyramid.
If no available pairs total 12, you lose.

## Control
- Click a bone with the left mouse button to select it.
- Press **Return** to start a new game.
- Press **Escape** to exit.

![Screenshot 2020-09-21 at 02 01 12](https://user-images.githubusercontent.com/32835381/93760427-a8d07280-fc14-11ea-8e10-2d36934e2e77.png)
