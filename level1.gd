extends Node2D 

@onready var build_counter: Label = $HUD/RepairCounter
@onready var win_message: Label = $HUD/WinMessage
@onready var game_over_message: Label = $HUD/GameOverMessage
@onready var instructions: Label = $HUD/Instructions
@onready var objective: Label = $HUD/Objective

@onready var goal: Area2D = $Goal
@onready var hazard: Area2D = $Hazard
@onready var hazard_visual: ColorRect = $Hazard/HazardVisual
@onready var player: CharacterBody2D = $Player

@onready var build_tiles = [
	$BrokenTile,
	$BrokenTile2,
	$BrokenTile3
]

var built_done := 0
var total_builds := 0
var game_won := false
var game_over := false
var warned_need_build := false


func _ready():
	total_builds = build_tiles.size()
	update_build_counter()
	
	win_message.visible = false
	game_over_message.visible = false
	
	win_message.text = "YOU WIN!"
	game_over_message.text = "GAME OVER"
	
	# Force messages to appear away from instructions
	win_message.position = Vector2(430, 180)
	win_message.size = Vector2(400, 80)
	
	game_over_message.position = Vector2(420, 180)
	game_over_message.size = Vector2(450, 80)
	
	for tile in build_tiles:
		tile.tile_repaired.connect(_on_tile_built)


func _process(_delta):
	if game_won or game_over:
		return
	
	check_hazard()
	
	if game_over:
		return
	
	check_goal()


func _input(event):
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()


func check_hazard():
	var hazard_center = hazard_visual.global_position + hazard_visual.size / 2
	var x_distance = abs(player.global_position.x - hazard_center.x)
	var y_distance = abs(player.global_position.y - hazard_center.y)
	
	if x_distance < 55 and y_distance < 75:
		show_game_over()


func check_goal():
	var distance_to_goal = player.global_position.distance_to(goal.global_position)
	
	if distance_to_goal < 400:
		if built_done >= total_builds:
			win_game()
		elif not warned_need_build:
			print("Build all path tiles first!")
			warned_need_build = true
	else:
		warned_need_build = false


func _on_tile_built():
	if game_over or game_won:
		return
	
	built_done += 1
	update_build_counter()
	print("Built count: " + str(built_done) + " / " + str(total_builds))


func update_build_counter():
	build_counter.text = "Built: " + str(built_done) + " / " + str(total_builds)


func show_game_over():
	game_over = true
	
	# Hide instruction text so GAME OVER does not overlap it
	instructions.visible = false
	objective.visible = false
	
	game_over_message.visible = true
	game_over_message.text = "GAME OVER"
	game_over_message.position = Vector2(420, 180)
	game_over_message.size = Vector2(450, 80)
	
	print("Game over!")


func win_game():
	if game_over:
		return
	
	game_won = true
	
	instructions.visible = false
	objective.visible = false
	
	win_message.visible = true
	win_message.text = "YOU WIN!"
	win_message.position = Vector2(430, 180)
	win_message.size = Vector2(400, 80)
	
	build_counter.text = "YOU WIN!"
	print("You win!")
