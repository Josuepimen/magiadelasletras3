extends Node2D

@onready var animated_sprite : AnimatedSprite2D = $Node2D/AnimatedSprite2D

func _ready():
	animated_sprite.play("caminando")
	await get_tree().create_timer(5.0).timeout
	animated_sprite.play("estatico")
