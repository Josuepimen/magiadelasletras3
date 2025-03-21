extends Button

# Importa la variable global
const Global = preload("res://singletonsscene.gd")

# Variable para verificar si el botón ya fue presionado
var button_pressedg = false

func _ready():
	# Verifica si el botón debe estar desactivado y desactiva si es necesario
	if Singletonsscene.isButtonDisabled(get_tree().get_current_scene().get_name(), get_name()):
		hide()  # Oculta el botón si está desactivado

func _on_pressed():
	# Verifica si el botón ya fue presionado
	if not button_pressedg:
		# Suma un punto al contador global
		Singletonsscene.add_puntaje()
		print ("sumando")
		# Desactiva el botón y lo hace invisible solo en esta escena
		disableButton()
		get_tree().change_scene_to_file("res://escenasentados2.tscn")
# Método para desactivar el botón y hacerlo invisible
func disableButton():
	var scene_name = get_tree().get_current_scene().get_name()
	var button_name = get_name()
	Singletonsscene.disableButton(scene_name, button_name, )
	hide()  # Oculta el botón
