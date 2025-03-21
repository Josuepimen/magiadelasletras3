extends Node2D

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
	# Aquí va tu lógica de movimiento del personaje
@export var speed = 100 

func _process(delta: float) -> void: 
	path_follow.progress += speed * delta


func _on_timer_timeout():
	hide()  

