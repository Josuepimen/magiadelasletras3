extends Node2D


signal uwu


var point_added = false
 # Asegúrate de tener un nodo Button en tu escena

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	$AudioStreamPlayer2D2.play()
	$Ambientacion.play()
	$Button2/AnimatedSprite2D2.play()
	$Button10/AnimatedSprite2D2.play()
	$AnimatedSprite2D.play()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://escenasentados2.tscn")



