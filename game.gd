extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Sheep:
		var sheep = body as Sheep
		# do sheepy things
		if !sheep.gathered:
			sheep.run_gathered_logic()

func _on_top_puuuuuuush_area_2d_body_entered(body: Node2D) -> void:
	_edge_force_set(body, Vector2.DOWN * 1000)

func _on_bottom_puuuuuuush_area_2d_2_body_entered(body: Node2D) -> void:
	_edge_force_set(body, Vector2.UP * 1000)

func _on_left_puuuuuuush_area_2d_2_body_entered(body: Node2D) -> void:
	_edge_force_set(body, Vector2.RIGHT * 1000)

func _on_right_puuuuuuush_area_2d_3_body_entered(body: Node2D) -> void:
	_edge_force_set(body, Vector2.LEFT * 1000)
	
func _on_edge_puuuuuuush_area_2d_body_exited(body: Node2D) -> void:
	_edge_force_set(body, Vector2.ZERO)

func _edge_force_set(body: Node2D, force: Vector2):
	if body is Sheep:
		var sheep = body as Sheep
		# do sheepy things
		sheep.linear_velocity_force = force
	
