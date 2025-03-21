extends Area2D
@onready var sonido_cuando_se_presiona = $"Sonido cuando se presiona"

@onready var music = $pronunciacioncuadro
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D2  # Asegúrate de tener un nodo Sprite2D en tu escena
var alreadyClicked = false
signal node_pressed

func _ready():
	set_process_input(true)
	sprite.visible = false  # Hacer el Sprite2D invisible al inicio
	sprite.play()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not alreadyClicked:
			$"../AudioStreamPlayer2D".stop()
			sonido_cuando_se_presiona.play()
			emit_signal("node_pressed")
			singletonscore.add_points(1)  # Suma los puntos solo si el objeto no ha sido clickeado antes
			music.play()
			sprite.visible = true  # Hacer el Sprite2D visible cuando se presiona el objeto
			alreadyClicked = true  # Mantén el objeto como ya clickeado
		else:
			music.play()  # Si el objeto ya ha sido clickeado, solo reproduce la música
		await(music.finished)  # Espera a que el audio termine de reproducirse
