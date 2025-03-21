extends Node2D
@onready var animated_sprite_2d_3 = $Mano

@onready var audio_stream_player_2d = $Bienvenido
@onready var animated_sprite_2ddd = $"Niña"
@onready var animated_sprite_2d = $Button/Button
@onready var button = $Button  # Asegúrate de tener un nodo Button en tu escena
@onready var celebration_sprite : AnimatedSprite2D = $CelebrationSprite  # Asegúrate de tener un nodo AnimatedSprite2D en tu escena
@onready var animated_sprite_2d_2 = $"Mano tutorial 1"
@onready var me = $Area2D/Path2D/PathFollow2D/ME

signal node_pressed
var alreadyClicked = false
var canClickAgain = false
func _ready():
	$AnimatedSprite2D.play()
	set_process_input(true)
	animated_sprite_2d.play()
	button.disabled = true  # Deshabilita el botón al inicio
	button.visible = false  # Hace invisible el botón al inicio
	celebration_sprite.visible = false  # Hace invisible el AnimatedSprite2D al inicio
	celebration_sprite.play()
	audio_stream_player_2d.play()
	animated_sprite_2ddd.play()
	animated_sprite_2d_2.play()
	animated_sprite_2d_2.visible = false
	animated_sprite_2d_3.play()
	me.play()
	# Desactivar todos los nodos hijos excepto el botón al inicio
	for child in get_children():
		if child is Area2D:  # Verifica si el nodo es del tipo Area2D
			child.connect("node_pressed", _on_node_pressed)
	await get_tree().create_timer(3.0).timeout
	animated_sprite_2d_3.visible = false
	$Button2/AnimatedSprite2D.play()
func _on_node_pressed():
	# Desactivar la detección de input en los nodos Area2D
	for child in get_children():
		if child is Area2D:
			child.input_pickable = false 
	# Activar un temporizador para habilitar el clickeo después de 5 segundos
	canClickAgain = false
	$Timer.start() # Desactiva la detección de input para el nodo Area2D # Desactiva la detección de input para el nodo Area2D  # Desactiva la detección de input para el nodo Area2D
func _process(delta: float) -> void:
	if singletonscore.score >= 5:
		await get_tree().create_timer(3.0).timeout
		$AudioStreamPlayer.play()
		button.disabled = false  # Habilita el botón cuando la puntuación es mayor o igual a 5
		button.visible = true  # Hace visible el botón
		celebration_sprite.visible = true  # Hace visible el AnimatedSprite2D
		celebration_sprite.play()  # Reproduce la animación de celebración
		animated_sprite_2d_2.visible = true
	else:
		button.disabled = true  # Deshabilita el botón si la puntuación es menor que 5
		button.visible = false  # Hace invisible el botón
		celebration_sprite.visible = false  # Hace invisible el AnimatedSprite2D

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and not alreadyClicked:
		singletonscore.score += 1
		alreadyClicked = true

func _on_button_pressed():
	singletonscore.reset_score()  # Reinicia la puntuación cuando se presiona el botón
	get_tree().change_scene_to_file("res://victoriaseleecionar2.tscn")


func _on_timer_timeout():
	canClickAgain = true
	for child in get_children():
		if child is Area2D:
			child.input_pickable = true  # Habilita la detección de input para el nodo Area2D


func _on_button_2_pressed():
	singletonscore.reset_score()
	get_tree().change_scene_to_file("res://escenasentados2.tscn")
