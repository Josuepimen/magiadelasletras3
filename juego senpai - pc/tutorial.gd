extends Control
class_name OptionsMenu

@onready var animation = $AnimatedSprite2D
@onready var animated_sprite_2d_3 = $AnimatedSprite2D3
@onready var audio_stream_player_22 = $AudioStreamPlayer2

@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var continue_button = $MarginContainer/VBoxContainer/continue_button as Button
@onready var animated_sprite_2d_2 = $AnimatedSprite2D2
@onready var animation_player = $AnimationPlayer


signal continue_options_menu

func _ready():
	animated_sprite_2d_2.play("animacion")
	animation_player.play("agrandar")
	continue_button.button_down.connect(on_continue_pressed)
	set_process(false)
	animated_sprite_2d.play()
	animation_player.play("mover")
	animation.play()
	animated_sprite_2d_3.play()
	await  get_tree().create_timer(.0).timeout
	audio_stream_player_22
func on_continue_pressed() -> void:
	continue_options_menu.emit()
	set_process(false)
