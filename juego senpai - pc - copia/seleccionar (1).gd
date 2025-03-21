extends Node2D

var score = 0
var scene_changed = false # Nueva variable para rastrear si ya has cambiado de escena

func _process(delta):
	# Paso 3
	if score >= 5 and not scene_changed: 
		scene_changed = true # Actualiza la variable a verdadero
		get_tree().change_scene_to_file("res://level.tscn")
