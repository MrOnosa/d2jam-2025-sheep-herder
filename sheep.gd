extends RigidBody2D


const SPEED = 10.0
const JUMP_VELOCITY = -400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dog_pos = %dog.position
	var doggo_dist = 1/position.distance_to(dog_pos) 
	#TODO Make the sheep run faster away from the dog when it's close
	linear_velocity = ((SPEED) * (position - dog_pos)) * doggo_dist
	print(linear_velocity)
	
