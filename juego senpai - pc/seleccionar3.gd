extends Node2D
@onready var animated_sprite_2dd = $AnimatedSprite2D

@onready var music = $AudioStreamPlayer2D
@onready var animated_sprite_2d = $Area2D5/AnimatedSprite2D
@onready var button = $Button  # Asegúrate de tener un nodo Button en tu escena
@onready var animated_sprite_2ddd = $Button/AnimatedSprite2D
@onready var animated_sprite_2d_2 = $Mano
var canClickAgain = false
signal node_pressed
func _ready():
	$AnimatedSprite2D2.play()
	music.play()
	animated_sprite_2dd.play()
	animated_sprite_2d.play()
	button.visible = false  # Hacer el botón invisible al inicio
	animated_sprite_2ddd.play()
	animated_sprite_2d_2.play()
	animated_sprite_2d_2.visible = false
	$Regresote/AnimatedSprite2D.play()
	for child in get_children():
		if child is Area2D:  # Verifica si el nodo es del tipo Area2D
			child.connect("node_pressed", _on_node_pressed)

func _on_node_pressed():
	# Desactivar la detección de input en los nodos Area2D
	for child in get_children():
		if child is Area2D:
			child.input_pickable = false 
  # Activar un temporizador para habilitar el clickeo después de 5 segundos
	canClickAgain = false
	$Timer.start()

func _process(delta):
	if singletonscore.score >= 5:
		await get_tree().create_timer(4.0).timeout

		button.visible = true 
		animated_sprite_2d_2.visible = true # Hacer el botón visible cuando la puntuación es mayor o igual a 5
	else:
		button.visible = false  # Hacer el botón invisible si la puntuación es menor que 5


func _on_button_pressed():
	get_tree().change_scene_to_file("res://menuvictoria3xd.tscn")
	singletonscore.reset_score()


func _on_timer_timeout():
	canClickAgain = true
	for child in get_children():
		if child is Area2D:
			child.input_pickable = true  # Habilita la detección de input para el nodo Area2D





func _on_regresote_pressed():
	singletonscore.reset_score()
	get_tree().change_scene_to_file("res://escenasentados2.tscn")
