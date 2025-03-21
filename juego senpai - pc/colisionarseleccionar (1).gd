extends CollisionShape2D


func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		queue_free() # Libera el objeto actual, eliminándolo de la escena
		Seleccionar.score += 1
