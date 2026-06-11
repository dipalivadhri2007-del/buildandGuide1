extends Area2D

signal tile_repaired

@export var repair_distance: float = 170.0

@onready var tile_visual: ColorRect = $TileVisual
@onready var repair_hint: Label = $RepairHint
@onready var player: CharacterBody2D = get_parent().get_node("Player")

var built := false

func _ready():
	tile_visual.color = Color.DARK_RED
	
	repair_hint.text = "Press E to build"
	repair_hint.visible = false
	repair_hint.z_index = 10


func _process(_delta):
	if built:
		repair_hint.visible = false
		return
	
	# Do not allow building after game over or after winning.
	if get_parent().game_over or get_parent().game_won:
		repair_hint.visible = false
		return
	
	var distance_to_player = player.global_position.distance_to(global_position)
	var player_near = distance_to_player < repair_distance
	
	if player_near:
		repair_hint.visible = true
		
		if Input.is_key_pressed(KEY_E):
			build_tile()
	else:
		repair_hint.visible = false


func build_tile():
	if built:
		return
	
	built = true
	tile_visual.color = Color.GREEN
	repair_hint.visible = false
	tile_repaired.emit()
	print(name + " built!")
