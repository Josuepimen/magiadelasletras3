extends Control


@onready var animated_sprite_2d_2 = $button/AnimatedSprite2D2
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@onready var animated_sprite_2d_22 = $AnimatedSprite2D

@onready var button = $button  # Asegúrate de tener un nodo Button en tu escena

# Called when the node enters the scene tree for the first time.
func _ready():
	button.visible = false  # Hacer el botón invisible al inicio
	$AudioStreamPlayer.play()
	animated_sprite_2d_2.play()
	animated_sprite_2d_22.play()
	animated_sprite_2d_22.visible = false
	audio_stream_player_2d.play()
	$Ambientacion.play()
func _on_timer_timeout():
	button.visible = true  # Hacer el botón visible después de que el Timer haya terminado
	animated_sprite_2d_22.visible = true
func _on_button_pressed():
	get_tree().change_scene_to_file("res://level2.tscn")
