extends Area2D

@onready var audioma = $Audioma

var alreadyClicked = false
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@onready var animated_sprite_2d = $Path2D/PathFollow2D/AnimatedSprite2D
@onready var animated_sprite_2dd = $AnimatedSprite2D

signal node_pressed

@export var speed : float = 200

func _ready():
	set_process_input(true)
	animated_sprite_2d.play("quieto")  # Asume que tienes una animación "normal_animation"
	animated_sprite_2dd.visible = false
	animated_sprite_2dd.play()
func _process(delta: float) -> void:
	if alreadyClicked:
		path_follow.progress += speed * delta

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$"Sonido cuando se presiona".play()
		$"../Bienvenido".stop()
		emit_signal("node_pressed")
		singletonscore.add_points(1)
		if alreadyClicked:
			audioma.stop()  # Detiene el audio actualmente en reproducción
		alreadyClicked = true
		$"../Area2D/Sonido cuando se presiona".play()
		audioma.play()  # Comienza a reproducir el audio
		await get_tree().create_timer(1.0).timeout
		animated_sprite_2dd.visible = true
		animated_sprite_2d.queue_free()  # Cambia a la segunda animación
		await(audioma.finished)  # Espera a que el audio termine de reproducirse
		alreadyClicked = false  # Hace que sea nuevamente clickeable
