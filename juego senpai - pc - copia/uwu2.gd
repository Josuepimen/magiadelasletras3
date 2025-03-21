extends Node2D

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@onready var animated_sprite : AnimatedSprite2D = $Path2D/PathFollow2D/AnimatedSprite2D

@export var speed : float = 100
var timer_visible : Timer
var timer_animation : Timer

func _ready():
	# Inicializa el sprite como invisible
	animated_sprite.visible = false
	# Crea un temporizador para hacer visible el sprite después de 2 segundos
	timer_visible = Timer.new()
	timer_visible.wait_time = 4.5
	timer_visible.one_shot = true
	timer_visible.connect("timeout", Callable(self, "_on_TimerVisible_timeout"))
	add_child(timer_visible)
	timer_visible.start()

	# Crea otro temporizador para cambiar la animación después de 8 segundos
	timer_animation = Timer.new()
	timer_animation.wait_time = 6.0
	timer_animation.one_shot = true
	timer_animation.connect("timeout", Callable(self, "_on_TimerAnimation_timeout"))
	add_child(timer_animation)
	# No iniciamos este temporizador aquí porque debe comenzar después de que el sprite se haga visible

func _process(delta: float) -> void:
	if animated_sprite.visible:
		path_follow.progress += speed * delta

func _on_TimerVisible_timeout() -> void:
	# Hace visible el sprite y comienza la animación 'caminando2d'
	animated_sprite.visible = true
	animated_sprite.play("caminando2d")
	# Inicia el temporizador para cambiar la animación después de 8 segundos
	timer_animation.start()

func _on_TimerAnimation_timeout() -> void:
	# Cambia la animación a 'quietoo' después de 8 segundos
	animated_sprite.play("quietoo")
