extends Area2D

# Declara la referencia al nodo AnimatedSprite dentro del área de drop
@onready var animated_sprite_2d = $AnimatedSprite2D


func _ready():
	animated_sprite_2d.play("normal")
func _on_Area2D_body_entered(body: Node) -> void:
	print("Colisión detectada: ", body.name)
	if body.name == "draggable1":
		animated_sprite_2d.stop("normal")
		cambiar_animacion()

func cambiar_animacion() -> void:
	print("cambio animacion")
	animated_sprite_2d.play("parado")
