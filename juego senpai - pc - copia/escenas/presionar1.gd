extends Sprite2D
@onready var audio_stream_player = $"../Sprite2D6/AudioStreamPlayer"

var initial_position 
var is_dragging = false # Manejo del estado de arrastre
var mouse_offset # Offset del mouse al centro en el clic
var delay = 0.2

func _ready():
	initial_position = position

func _physics_process(delta):
	if is_dragging:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position() - mouse_offset, delay * delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				print('clicked on sprite')
				is_dragging = true
				mouse_offset = get_global_mouse_position() - global_position

		else:
			if is_dragging:
				is_dragging = false
				position = initial_position
				$"../1".stop()
				audio_stream_player.play()
