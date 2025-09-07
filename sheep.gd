extends RigidBody2D


const SPEED := 10000.0
const SCARED_OF_DOG_SPEED := 20000.0
const run_doggy_logic := true
const run_sheep_herding_mentality_logic := true

var total_other_sheep := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var doggy_linear_velocity := Vector2.ZERO
	var sheep_linear_velocity := Vector2.ZERO
	if run_doggy_logic:
		var dog_pos = %dog.position
		var dist_squared = position.distance_squared_to(dog_pos) - 27000
		if dist_squared < 1000:
			dist_squared = 1000
		var doggo_dist = 1 / (dist_squared)
		#TODO Make the sheep run faster away from the dog when it's close
		doggy_linear_velocity = SCARED_OF_DOG_SPEED * ((position - dog_pos)) * doggo_dist
		#angular_velocity = position.angle_to_point(dog_pos) - angular_velocity
		#print("Dist " + str(dist_squared) + " doggo_dist " + str(doggo_dist) + " Linear velocity " + str(linear_velocity))
	
	if run_sheep_herding_mentality_logic:
		var force := Vector2.ZERO
		var all_sheep = get_tree().get_nodes_in_group("sheep")
		for s in all_sheep:
			if s == self: 
				continue
			var sheep_pos = s.position
			var dist_squared = position.distance_squared_to(sheep_pos) - 10000
			if dist_squared < 100:
				dist_squared = 100
			var sheep_dist = 1/(dist_squared) 
			var influcence = SPEED * ((sheep_pos - position)) * sheep_dist
			force += (influcence)/(all_sheep.size()-1)
		sheep_linear_velocity = force
	
	linear_velocity = doggy_linear_velocity + sheep_linear_velocity
