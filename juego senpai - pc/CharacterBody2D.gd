extends CharacterBody2D

@onready var path_follow = $Path2D/PathFollow2D

func _physics_process(delta):
	path_follow.offset += 100 * delta  # Ajusta la velocidad a tu gusto
	position = path_follow.position
