extends Area2D
@onready var animated_sprite_2d_2 = $AnimatedSprite2D2
@onready var sonido_cuando_se_presiona = $"Sonido cuando se presiona"
@onready var collision = $CollisionShape2D

@onready var music = $pronunciacionpiedra
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D  # Asegúrate de tener un nodo Sprite2D en tu escena
var alreadyClicked = false
signal node_pressed
func _ready():
	set_process_input(true)
	sprite.visible = false  # Hacer el Sprite2D invisible al inicio
	sprite.play()
	animated_sprite_2d_2.play()


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not alreadyClicked:
			sonido_cuando_se_presiona.play()
			$"../AudioStreamPlayer2D".stop()
			emit_signal("node_pressed")
			singletonscore.add_points(1)  # Suma los puntos solo si el objeto no ha sido clickeado antes
			music.play()
			sprite.visible = true  # Hacer el Sprite2D visible cuando se presiona el objeto
			alreadyClicked = true  # Mantén el objeto como ya clickeado
			collision.disabled = true
		else:
			music.play()  # Si el objeto ya ha sido clickeado, solo reproduce la música
		await(music.finished)  # Espera a que el audio termine de reproducirse
