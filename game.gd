extends Node2D

var global_timer := 0.0
var unfroze_sheep := false
var win_condition_met := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var all_sheep = get_tree().get_nodes_in_group("sheep")
	for s in all_sheep:
		s.freeze = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("restart"):
		_on_texture_button_pressed()
		
	if %dog.has_ever_moved:
		if !unfroze_sheep:
			var all_sheep = get_tree().get_nodes_in_group("sheep")
			for s in all_sheep:
				s.freeze = false
			unfroze_sheep = true
		if !win_condition_met:
			global_timer += delta
		
		var minutes := global_timer / 60
		var seconds := fmod(global_timer, 60)
		var milliseconds := fmod(global_timer, 1) * 100
		var time_string := "Time: %02d:%02d" % [minutes, seconds]
		%Timer.text = time_string	
		
		if win_condition_met:
			var time_string_long := "Time: %02d:%02d.%03d" % [minutes, seconds, milliseconds]
			%Timer.text = "Sheep gathered! " + time_string_long

func _on_area_2d_body_entered(body: Node2D) -> void:
	var all_sheep_gathered = true
	if body is Sheep:
		var sheep = body as Sheep
		# do sheepy things
		if !sheep.gathered:
			sheep.run_gathered_logic()
	
	var all_sheep = get_tree().get_nodes_in_group("sheep")
	for s in all_sheep:
		all_sheep_gathered = all_sheep_gathered && s.gathered 
	
	if all_sheep_gathered:
		_win()

func _win():
	win_condition_met = true
	%RestartButton.scale = Vector2.ONE
	
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

func _on_texture_button_pressed() -> void:
	get_tree().reload_current_scene()

	
