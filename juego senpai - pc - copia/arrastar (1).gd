extends Area2D

var isGrabbed = false
var grabOffset = Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and is_mouse_over():
				isGrabbed = true
				grabOffset = global_transform.origin - get_global_mouse_position()
			elif !event.pressed:
				isGrabbed = false

func _process(delta):
	if isGrabbed:
		global_position = get_global_mouse_position() + grabOffset
