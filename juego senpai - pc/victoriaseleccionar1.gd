extends Node2D


var point_added = false


var hola


func _ready():
	$Button11/AnimatedSprite2D.play()
  # Hacer el botón invisible al inicio
	$Button2/AnimatedSprite2D.play()
	$AnimatedSprite2D.play()
	#$AudioStreamPlayer.play()
	$Ambientacion.play()
	$AudioStreamPlayer2D2.play()
	$AudioStreamPlayer2D.play()



func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://escenasentados2.tscn")
