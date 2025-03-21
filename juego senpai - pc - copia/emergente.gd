extends Control

@onready var tuto = preload("res://escenas/main.tscn") as PackedScene
@onready var tuto_iniciar = $MarginContainer/HBoxContainer/VBoxContainer/tuto as Button
@onready var tutorialx = $MarginContainer/HBoxContainer/VBoxContainer/tutorial as Button
@onready var tutorial = $tutorial as OptionsMenu
@onready var margin_container = $MarginContainer as MarginContainer
@onready var music2 = $AudioStreamPlayer2D 
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animated_sprite_2dx = $MarginContainer/HBoxContainer/VBoxContainer/tuto/AnimatedSprite2D
@onready var creditos = $MarginContainer/HBoxContainer/VBoxContainer/creditos
@onready var animated_sprite_2dd = $MarginContainer/HBoxContainer/VBoxContainer/creditos/AnimatedSprite2D
@onready var audio_stream_player = $AudioStreamPlayer
@onready var animated_sprite_2d_3 = $AnimatedSprite2D3
@onready var animated_sprite_2d_4 = $AnimatedSprite2D4
@onready var audio_stream_player_2 = $AudioStreamPlayer2


func _ready():
	handle_connecting_signals()
	music2.play()
	animated_sprite_2d.play()
	animated_sprite_2dx.play()
	animated_sprite_2dd.play()
	animated_sprite_2d_3.play()
	animated_sprite_2d_4.play()
	animated_sprite_2d_4.visible = false
func on_tuto_pressed() -> void:
	get_tree().change_scene_to_file("res://escena sentados.tscn")

func on_tutorialx_pressed() -> void:
	animated_sprite_2d_3.visible = false
	music2.stop()
	margin_container.visible = false
	tutorial.set_process(true)
	tutorial.visible = true
	audio_stream_player.play()
	animated_sprite_2d_4.visible = false

func on_button_down() -> void:
	pass

func on_continue_options_menu() -> void:
	margin_container.visible = true
	tutorial.visible = false
	audio_stream_player.stop()
	animated_sprite_2d_3.play()
	animated_sprite_2d_4.visible = true
	$AudioStreamPlayer2.play()

func handle_connecting_signals() -> void:
	tuto_iniciar.button_down.connect(on_tuto_pressed)
	tutorialx.button_down.connect(on_tutorialx_pressed)
	tutorial.continue_options_menu.connect(on_continue_options_menu)


func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://creditoss.tscn")
