extends CharacterBody2D

@export var speed: float = 250.0
@export var jump_speed: float = -600.0
@export var gravity: float = 900.0

func _physics_process(_delta):
	var direction := 0.0

	# Move left
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		direction -= 1.0

	# Move right
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		direction += 1.0

	direction = clamp(direction, -1.0, 1.0)

	# Horizontal movement
	velocity.x = direction * speed

	# Gravity
	if not is_on_floor():
		velocity.y += gravity * _delta

	# Jump using Up Arrow or Spacebar
	if is_on_floor() and (Input.is_action_just_pressed("ui_up") or Input.is_key_pressed(KEY_SPACE)):
		velocity.y = jump_speed

	move_and_slide()
