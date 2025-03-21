extends Sprite2D

var is_dragging = false # Manejo de estado
var mouse_offset # Offset del ratón al centro en el clic
var delay = 0.2
var drop_spots
var initial_position # Posición inicial del sprite

func _ready():
	drop_spots = get_tree().get_nodes_in_group("drop_spot_group")
	initial_position = position

func _physics_process(delta):
	if is_dragging:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position() - mouse_offset, delay * delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				is_dragging = true
				mouse_offset = get_global_mouse_position() - global_position
		else:
			is_dragging = false
			if not is_dropped():
				position = initial_position

func is_dropped() -> bool:
	for drop_spot in drop_spots:
		if drop_spot.has_overlapping_areas() and drop_spot.get_overlapping_areas().has(self.get_node("Area2D")):
			# El objeto draggable ha entrado en el área de drop
			drop_spot.call_deferred("cambiar_animacion")
			$AudioStreamPlayer2D.play()

			cambiar_escena() # Llamar a cambiar_escena() aquí
			# Centrar la posición del objeto draggable en el área de drop
			position = drop_spot.global_position
			return true
	return false


func cambiar_escena():
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://win5.tscn")
