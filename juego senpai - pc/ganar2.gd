extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.set_disabled(true) # Deshabilitar el botón al inicio
	var timer = Timer.new() # Crear un nuevo Timer
	timer.set_wait_time(5.0) # Establecer el tiempo de espera a 5 segundos
	timer.one_shot = true # El Timer solo se ejecutará una vez
	timer.connect("timeout", _on_timer_timeout.bind(self)) # Conectar la señal "timeout" del Timer a la función "_on_Timer_timeout"
	add_child(timer) # Añadir el Timer como hijo de este nodo
	timer.start() # Iniciar el Timer
	$Button.connect("pressed", _on_button_pressed.bind(self)) # Conectar la señal "pressed" del botón a la función "_on_Button_pressed"

# Esta función se llamará cuando el Timer llegue a cero
func _on_timer_timeout():
	$Button.set_disabled(false) # Habilitar el botón después de que el Timer haya terminado

func _on_button_pressed():
	get_tree().change_scene_to_file("res://level3.tscn")
