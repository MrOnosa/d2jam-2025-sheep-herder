extends CharacterBody2D
class_name Dog

const SPEED = 600.0
const JUMP_VELOCITY = -400.0

var has_ever_moved := false

func _physics_process(delta: float) -> void:	

	var horizontal_axis := Input.get_axis("left", "right")
	if horizontal_axis:
		has_ever_moved = true
		velocity.x = horizontal_axis * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var vert_axis := Input.get_axis("up", "down")
	if vert_axis:
		has_ever_moved = true
		velocity.y = vert_axis * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
