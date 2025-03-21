extends Node

class_name singletonsscene

signal button_activate
var boton_habilitado = true
var puntaje = 0


var button_states = {}


# Método para desactivar un botón en una escena específica
func disableButton(scene_name: String, button_name: String) -> void:
	button_states[scene_name + ":" + button_name] = true

# Método para verificar si un botón está desactivado en una escena específica
func isButtonDisabled(scene_name: String, button_name: String) -> bool:
	return button_states.has(scene_name + ":" + button_name) and button_states[scene_name + ":" + button_name]
func increment_puntaje(amount):
	puntaje += amount
	check_victory()

func reset_puntaje():
	puntaje = 0

func add_puntaje():
	increment_puntaje(1)





func check_victory():
	if puntaje >= 4:
		await get_tree().create_timer(0.01).timeout
		get_tree().change_scene_to_file("res://Victoria.tscn")
		reset_puntaje()
