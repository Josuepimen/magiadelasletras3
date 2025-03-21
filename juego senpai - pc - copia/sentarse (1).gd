extends Node2D
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@onready var animated_sprite : AnimatedSprite2D = $Path2D/PathFollow2D/AnimatedSprite2D

@export var speed : float = 100

func _process(delta: float) -> void:
	path_follow.progress += speed * delta
func _ready():
	animated_sprite.play("caminando")
	await get_tree().create_timer(9.5).timeout
	animated_sprite.play("estatico")
