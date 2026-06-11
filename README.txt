Build and Guide- README

Game Title: BUILD & GUIDE

Engine:
Godot 4.6

GitHub Link : https://github.com/dipalivadhri2007-del/buildandGuide1

Itch.io Link
https://dipalivadhri2007-del.itch.io/buildandguide

Game Description:
Build & Guide is a game where the player stands near each unbuilt floor tile, builds it avoid one hazard and then reach the blue goal line. The player wins only after building all three broken tiles by pressing the Key E. The game uses Guide because teh player must guide the builder safely across the level to reach its goal.
The tiles are beige in colour and when you press E the tile gets built and changes it color to Green. Once all the tiles are built the player can be guided to his destination 

Theme / Core Verbs:
Build and Guide

Controls:
A / Left Arrow - Move left
D / Right Arrow - Move right
Space / Up Arrow - Jump
E - Build tile
R - Restart level

How to Play:
1. Move across the platform. You can move left, right, up and down and jump. 
2. Stand near each unbuilt tile.
3. Press E to build the tile.
4. Avoid the red danger hazard.
5. After building all 3 tiles, reach the blue goal to win.
6. Press R to restart the game.

Win Condition:
Build all 3 unbuilt tiles and reach the blue goal.

Lose Condition:
Touch the red danger hazard.

Assets Used:
- Godot default icon.svg was used as the temporary player sprite.
- ColorRect nodes were used for the floor, unbuilt tiles, built tiles, hazard, and goal.
- No external image or audio assets were used.

Scripts:
- player.gd controls player movement and jumping.
- broken_tile.gd controls tile building behavior.
- level1.gd controls build counter, win condition, game over condition, hazard detection, and restart.


