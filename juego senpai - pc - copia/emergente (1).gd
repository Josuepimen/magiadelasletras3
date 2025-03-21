class_name MainMenu
extends Control
@onready var tuto = preload("res://escenas/main.tscn") as PackedScene
@onready var tuto_iniciar = $MarginContainer/HBoxContainer/VBoxContainer/tuto as Button
@onready var tutorialx = $MarginContainer/HBoxContainer/VBoxContainer/tutorial as Button
@onready var tutorial = $tutorial as OptionsMenu
@onready var margin_container = $MarginContainer as MarginContainer

func _ready():
	handle_connecting_signals()

func on_tuto_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/seleccionar.tscn")

func on_tutorialx_pressed() -> void:
	margin_container.visible = false
	tutorial.set_process(true)
	tutorial.visible = true

func on_button_down() -> void:
	pass

func on_continue_options_menu() -> void:
	margin_container.visible = true
	tutorial.visible = false

func handle_connecting_signals() -> void:
	tuto_iniciar.button_down.connect(on_tuto_pressed)
	tutorialx.button_down.connect(on_tutorialx_pressed)
	tutorial.continue_options_menu.connect(on_continue_options_menu)
