extends RigidBody2D


const SPEED = 10000.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dog_pos = %dog.position
	var dist_squared = position.distance_squared_to(dog_pos) - 27000
	if dist_squared < 1000:
		dist_squared = 1000
	var doggo_dist = 1 / (dist_squared)
	#TODO Make the sheep run faster away from the dog when it's close
	linear_velocity = SPEED * ((position - dog_pos)) * doggo_dist
	#angular_velocity = position.angle_to_point(dog_pos) - angular_velocity
	#print("Dist " + str(dist_squared) + " doggo_dist " + str(doggo_dist) + " Linear velocity " + str(linear_velocity))
	
