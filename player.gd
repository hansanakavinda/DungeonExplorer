extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

@export var speed := 200
@export var jump_force := -400
@export var gravity := 900

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_force

	# Horizontal movement
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# Flip sprite
	if direction < 0:
		anim.flip_h = true
	elif direction > 0:
		anim.flip_h = false

	# Animation states
	if not is_on_floor():
		anim.play("jump")
	elif direction != 0:
		anim.play("run")
	else:
		anim.play("idle")

	move_and_slide()
