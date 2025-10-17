extends CharacterBody2D

@export var speed := 200
@export var jump_force := -400
@export var gravity := 900  # positive value (pulls down)
@export var jump_count := 0

func _physics_process(delta):
	# Apply gravity
	
	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("ui_accept") && jump_count < 1:
			jump_count += 1
			velocity.y = jump_force
	else:
		# If on floor, allow jumping
		jump_count = 0
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_force

	# Horizontal movement (optional)
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	move_and_slide()
