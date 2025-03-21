extends Control



var point_added = false


@onready var animation_player = $AnimationPlayer


func _ready():

# Hacer el botón invisible al inicio
	$Ambientacion.play()
	animation_player.play("descanso")
	$Button2/AnimatedSprite2D2.play()
	$AudioStreamPlayer2D.play()
	$Button40/AnimatedSprite2D2.play()
	$AnimatedSprite2D.play()
	$AudioStreamPlayer.play()
	#if Singletonsscene.boton_habilitado:
		#Singletonsscene.boton_habilitado = false




func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://escenasentados2.tscn")
