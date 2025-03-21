extends Control

@onready var audio_stream_player = $AudioStreamPlayer

@onready var animated_sprite_2d_2 = $Button/AnimatedSprite2D2


@onready var animation_player = $AnimationPlayer
@onready var button = $Button
  # Asegúrate de tener un nodo Button en tu escena

# Called when the node enters the scene tree for the first time.
func _ready():
	button.visible = false  # Hacer el botón invisible al inicio
	audio_stream_player.play()


func _on_timer_timeout():
	button.visible = true  # Hacer el botón visible después de que el Timer haya terminado

func _on_button_pressed():
	get_tree().change_scene_to_file("res://escena sentados2.tscn")

