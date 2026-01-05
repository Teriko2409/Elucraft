extends CharacterBody2D



var SPEED = 300.0

var JUMP_VELOCITY = -500.0
var double_jump_available = true

const dash_speed = 800
var dashing = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump and double jump
	if Input.is_action_just_pressed("jump_button"):
	
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			double_jump_available = true
		elif double_jump_available:
			velocity.y = JUMP_VELOCITY 
			double_jump_available = false
			
	if Input.is_action_just_pressed("dash_button"):
		dashing = true
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left_button", "move_right_button")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
