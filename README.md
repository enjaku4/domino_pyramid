# Domino Pyramid
A simple single player domino game built with the [ruby2d](https://github.com/ruby2d/ruby2d) gem.

To launch the game install the gems from the `Gemfile` and run `app.rb`.

## Rules
Bones (domino tiles) are laid in the shape of pyramid spots (pips) down, only the first and the last rows are revealed. 
A player has to find pairs of bones which total rank (weight) equals 12. By clicking such pairs the player deletes them from the pyramid potentially unblocking 
and revealing the other ones. The goal is to delete all the bones from the pyramid by repeating aforementioned process. If there are no bones left on the board
the player wins. If there are no pairs among the revealed bones which total rank equals 12 the player looses.

## Control
- To select a bone click it with the **left mouse button**.
- To start a new game press **return**.
- To exit press **escape**.

![Screenshot 2020-09-15 at 02 01 12](https://user-images.githubusercontent.com/32835381/93147000-f3279000-f6f8-11ea-9cb6-4eeb6d6e56bc.png)
