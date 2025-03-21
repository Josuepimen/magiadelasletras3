extends Node2D
var sprite : AnimatedSprite2D
var timer
@onready var animate = $AnimatedSprite2D

func _ready():
	#sprite = $AnimatedSprite2D
	#timer = $aparecer5
	#timer.start()
	#sprite.visible = false
	set_process_input(false) # Desactiva la detección de clics


func _on_aparecer_5_timeout():
	#sprite.visible = true
	#set_process_input(true) 
	animate.play()

