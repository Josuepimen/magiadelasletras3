extends Node2D


var point_added = false


func _ready():
	$Button70/AnimatedSprite2D2.play()
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play()
	$AudioStreamPlayer2D2.play()
	
  # Hacer el botón invisible al inicio

	$Button2/AnimatedSprite2D2.play()

	$Ambientacion.play()



func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://escenasentados2.tscn")
