extends Area2D
@onready var collision = $CollisionShape2D
@onready var audio_player: AudioStreamPlayer2D = $Audiome
var alreadyClicked = false
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var sprite_2d = $Path2D/PathFollow2D/ME
signal node_pressed

@export var speed : float = 200

func _ready():
	set_process_input(true)
	animated_sprite_2d.visible = false
	sprite_2d
func _process(delta: float) -> void:
	if alreadyClicked:
		path_follow.progress += speed * delta

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("node_pressed")
		$"../Bienvenido".stop()
		singletonscore.add_points(1)
		if alreadyClicked:
			audio_player.stop()  
		$"Sonido cuando se presiona".play()
		alreadyClicked = true
		audio_player.play()  # Comienza a reproducir el audio
		await get_tree().create_timer(1.0).timeout
		collision.disabled = true
		sprite_2d.queue_free()
		animated_sprite_2d.visible = true
		animated_sprite_2d.play()  # Cambia a la segunda animación
		await(audio_player.finished)  # Espera a que el audio termine de reproducirse
		alreadyClicked = false  # Hace que sea nuevamente clickeable
