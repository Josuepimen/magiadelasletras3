extends AnimatedSprite2D


@onready var anim = $sol

func _ready():
	anim.play("sol")
