extends CharacterBody2D

@export var speed: float = 120.0   # horizontal movement speed (px/s)
var direction: int = 1             # 1 = right (start), -1 = left

func _physics_process(delta: float) -> void:
	# set horizontal velocity according to direction
	velocity.x = direction * speed

	# move and collide
	move_and_slide()

	# if we hit a wall during move_and_slide(), flip direction
	if is_on_wall():
		direction *= -1

	# flip sprite horizontally to face movement direction (if a Sprite2D child exists)
	if has_node("Sprite2D"):
		$Sprite2D.flip_h = direction < 0

func _on_damage_area_body_entered(body: Node2D) -> void:
	# Prefer groups so name changes don't break things
	print(body)
	print("hit")
	if (body.is_in_group("player")) or (body.name == "Player"):
		print("Player hit by enemy!")
