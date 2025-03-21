extends Node2D
var animated_sprite : AnimatedSprite2D
var timer

func _ready():
	animated_sprite = $AnimatedSprite2D
	timer = $Aparecer2
	timer.start()
	animated_sprite.visible = false
	animated_sprite.play("quieto")
	set_process_input(false) # Desactiva la detección de clics

func _on_timer_timeout():
	animated_sprite.visible = true
	set_process_input(true) # Activa la detección de clics

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		## Cambiar a la siguiente escena
		get_tree().change_scene_to_file("res://escena sentados.tscn")

