extends Area2D

signal scoreAdded(points)

func _ready():
	set_process_input(true)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		queue_free() # Libera el objeto actual, eliminándolo de la escena
		

