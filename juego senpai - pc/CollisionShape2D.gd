extends CollisionShape2D

var puntos = 0
var label : Label

func _ready():
	label = get_node("/root/Label") # Asegúrate de que la ruta al nodo Label sea correcta
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		puntos += 1
		label.text = "Puntos: " + str(puntos)
		if puntos >= 5:
			get_tree().change_scene("res://otra_escena.tscn")
		else:
			get_parent().get_node("Sprite").visible = false
