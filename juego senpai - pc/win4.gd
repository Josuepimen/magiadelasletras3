extends Control

@onready var audio_stream_player = $AudioStreamPlayer
@onready var animated_sprite_2d_25 = $AnimatedSprite2D2
@onready var animated_sprite_2d_3 = $AnimatedSprite2D3
@onready var animated_sprite_2d_4 = $AnimatedSprite2D4
@onready var animated_sprite_2d_5 = $AnimatedSprite2D5

@onready var animated_sprite_2d_2 = $Button/AnimatedSprite2D2
@onready var animated_sprite_2d_22 = $AnimatedSprite2D
@onready var audio_stream_player_32 = $AudioStreamPlayer2


@onready var animation_player = $AnimationPlayer
@onready var button = $Button
  # Asegúrate de tener un nodo Button en tu escena

# Called when the node enters the scene tree for the first time.
func _ready():
	button.visible = false  # Hacer el botón invisible al inicio
	audio_stream_player.play()
	animation_player.play("descanso")
	animated_sprite_2d_2.play()
	animated_sprite_2d_22.play()
	animated_sprite_2d_22.visible = false
	audio_stream_player_32.play()
	animated_sprite_2d_25.play()
	animated_sprite_2d_3.play()
	animated_sprite_2d_4.play()
	animated_sprite_2d_5.play()
	$Ambientacion.play()
func _on_timer_timeout():
	button.visible = true  # Hacer el botón visible después de que el Timer haya terminado
	animated_sprite_2d_22.visible = true
func _on_button_pressed():
	get_tree().change_scene_to_file("res://level5.tscn")


