extends Control

@onready var audio_stream_player = $AudioStreamPlayer

@onready var animated_sprite_2dd = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button/AnimatedSprite2D.play()
	audio_stream_player.play()
	animated_sprite_2dd.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://emergente.tscn")
