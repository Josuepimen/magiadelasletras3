extends Node2D

@onready var anim = $sol

func _ready():
	anim.play("sol")


func _on_botonprueba_pressed():
	get_tree().change_scene_to_file("res://escena sentados.tscn")
