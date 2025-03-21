extends Node
@onready var audio_stream_player_2d1 = $Button/AudioStreamPlayer2D
@onready var audio_stream_player_2d2 = $Button2/AudioStreamPlayer2D
@onready var audio_stream_player_2d3 = $Button3/AudioStreamPlayer2D
@onready var audio_stream_player_2d4 = $Button4/AudioStreamPlayer2D
@onready var animated_sprite_2djhg= $AnimatedSprite2D

@onready var music1 = $AudioStreamPlayer2D
@onready var animated_sprite_2d = $AnimatedSprite2D

var timer: float = 0
var button_delay: float = 10.0  # Tiempo de retraso en segundos

func _ready() -> void:
	$AnimatedSprite2D2.play()
	animated_sprite_2djhg.play()
	music1.play()
	$Button.set_disabled(true)  # Deshabilitar los botones al inicio
	$Button2.set_disabled(true)
	$Button3.set_disabled(true)
	$Button4.set_disabled(true)
func _process(delta: float) -> void:
	# Contar el tiempo transcurrido
	timer += delta

	# Permitir que los botones sean presionados después del retraso
	if timer >= button_delay:
		$Button.set_disabled(false)  # Reemplaza "Button" con el nombre real de tus botones
		$Button2.set_disabled(false)
		$Button3.set_disabled(false)
		$Button4.set_disabled(false)

func _on_button_pressed() -> void:
	audio_stream_player_2d1.play()
	await get_tree().create_timer(4.0).timeout
	get_tree().change_scene_to_file("res://escenas/seleccionar.tscn")

func _on_button_2_pressed() -> void:
	audio_stream_player_2d2.play()
	await get_tree().create_timer(4.0).timeout
	get_tree().change_scene_to_file("res://Seleccionar2.tscn")

func _on_button_3_pressed() -> void:
	audio_stream_player_2d3.play()
	await get_tree().create_timer(4.0).timeout
	get_tree().change_scene_to_file("res://seleccionar3.tscn")

func _on_button_4_pressed() -> void:
	audio_stream_player_2d4.play()
	await get_tree().create_timer(4.0).timeout
	get_tree().change_scene_to_file("res://escenas/level.tscn")
