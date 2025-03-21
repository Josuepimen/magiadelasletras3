extends Node2D
@onready var music = $AudioStreamPlayer2D
@onready var animated_sprite_2d_2 = $AnimatedSprite2D2
signal node_pressed
@onready var Mano = $Mano

var canClickAgain = false

func _ready():
	music.play()
	animated_sprite_2d_2.play()
	Mano.play()
	$Maestra.play("idel")
	for child in get_children():
		if child is Area2D:  # Verifica si el nodo es del tipo Area2D
			child.connect("node_pressed", _on_node_pressed)
	Mano.visible = false
	await get_tree().create_timer(6.0).timeout
	Mano.visible = true
	await get_tree().create_timer(2.0).timeout
	Mano.visible = false
	$Button/AnimatedSprite2D.play()
	$Maestra.play()

func _on_node_pressed():
	# Desactivar la detección de input en los nodos Area2D
	for child in get_children():
		if child is Area2D:
			child.input_pickable = false 
  # Activar un temporizador para habilitar el clickeo después de 5 segundos
	canClickAgain = false
	$Timer.start()

@warning_ignore("unused_parameter")
func _process(delta):
	if singletonscore.score >= 5 and not singletonscore.scene_changed:
		singletonscore.scene_changed = false
		singletonscore.reset_score()
		await get_tree().create_timer(11.0).timeout
		get_tree().change_scene_to_file("res://victoriaseleccionar1.tscn")


func _on_timer_timeout():
	canClickAgain = true
	for child in get_children():
		if child is Area2D:
			child.input_pickable = true  # Habilita la detección de input para el nodo Area2D


func _on_button_pressed():
	singletonscore.reset_score()
	get_tree().change_scene_to_file("res://escenasentados2.tscn")
