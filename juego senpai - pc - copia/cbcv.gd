extends Area2D

signal scoreAdded(points)

var alreadyClicked = false

func _ready():
	set_process_input(true)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and not alreadyClicked:
 
		singletonscore.score += 1
		alreadyClicked = true

