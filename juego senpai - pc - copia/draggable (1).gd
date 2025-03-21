extends Sprite2D
var is_dragging = false #state management
var mouse_offset #center mouse on click
var delay = .2
var drop_spots
var new_scene = "res://escenas/main.tscn" # Asegúrate de cambiar esto a la ruta de tu nueva escena
 
func _ready():
	drop_spots = get_tree().get_nodes_in_group("drop_spot_group")
	
func _physics_process(delta):
	if is_dragging == true:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position()-mouse_offset, delay * delta)
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				
				is_dragging = true
				mouse_offset = get_global_mouse_position() - global_position
		else:
			is_dragging = false
			for drop_spot in drop_spots:
				if drop_spot.has_overlapping_areas() and drop_spot.get_overlapping_areas().has(self.get_node("Area2D")):
					var snap_position = drop_spot.position
					var tween = get_tree().create_tween()
					tween.tween_property(self, "position", snap_position, delay)
					get_tree().change_scene_to_file("res://escenas/main.tscn") # Cambia a la nueva escena
