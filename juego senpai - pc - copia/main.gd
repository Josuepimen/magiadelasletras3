extends Node2D
@onready var music = $AudioBienvenida

@onready var musica = $AnimationPlayer
var timer : float = 0
var change_scene_delay : float = 12.3
var scene_to_load : String = "res://OtraEscena.tscn"
func _ready():
	MusicPlayer.play()
	var timer_node = $Timer
	if timer_node:
		timer_node.wait_time = change_scene_delay
		# Usar Callable para conectar la señal 'timeout' a la función '_on_timer_timeout'
		timer_node.connect("timeout", Callable(self, "_on_timer_timeout"))
		timer_node.start()

	
	music.play()
	
	musica.play("Letrasmovida")
func _on_timer_timeout():
	# Cambiar a la escena deseada cuando haya pasado el tiempo especificado
	change_scene()


func change_scene() -> void:
	# Cargar y cambiar a la escena especificada
	get_tree().change_scene_to_file("res://emergente.tscn")
