extends Area2D
@onready var sonido_cuando_se_presiona = $"Sonido cuando se presiona"

@onready var audio_stream_player = $AudioStreamPlayer
@onready var sprite = $objeto1
@onready var animation_player = $"../AnimationPlayer"
@onready var anim = $AnimatedSprite2D
@onready var animated_sprite_2d_2 = $AnimatedSprite2D2
@onready var animated_sprite_2d_3 = $AnimatedSprite2D3
@onready var animated_sprite_2d_4 = $AnimatedSprite2D4
@onready var animated_sprite_2d_5 = $AnimatedSprite2D5
signal node_pressed
var clicked = false
signal scoreAdded(points)

func _ready():
	set_process_input(true)
	anim.play("animacion_1")
	animated_sprite_2d_2.play()
	animated_sprite_2d_2.visible = false
	animated_sprite_2d_3.play()
	animated_sprite_2d_3.visible = false
	animated_sprite_2d_4.play()
	animated_sprite_2d_4.visible = false
	animated_sprite_2d_5.play()
	animated_sprite_2d_5.visible = false
	$Destornillador.visible = false
func _input_event(viewport, event, shape_idx):
	if not clicked and event is InputEventMouseButton and event.pressed:
		clicked = true
		$Destornillador.visible = true
		$Destornillador.play()
		$"../AudioStreamPlayer2D".stop()
		sonido_cuando_se_presiona.play()
		emit_signal("node_pressed")
		audio_stream_player.play()
		singletonscore.add_points(1)
		animation_player.play("scale_up2")
		await(get_tree().create_timer(6.0)).timeout
		animated_sprite_2d_2.visible = true
		
	# Temporizador para hacer visible sprite_2d_2 después de 3 segundos
		await(get_tree().create_timer(1.0)).timeout
		animated_sprite_2d_3.visible = true
		
	# Temporizador para hacer visible sprite_2d_3 después de 4 segundos
		await(get_tree().create_timer(1.0)).timeout
		animated_sprite_2d_4.visible = true
		
		await(get_tree().create_timer(1.0)).timeout
		animated_sprite_2d_5.visible = true
		await(get_tree().create_timer(1.0)).timeout
		animated_sprite_2d_2.queue_free()
		animated_sprite_2d_3.queue_free()
		animated_sprite_2d_4.queue_free()
		animated_sprite_2d_5.queue_free()
		$Destornillador.queue_free()
		sprite.visible = false
		sprite.queue_free()
		anim.play("animacion_2") # Reproduce la animacion_2 en el AnimatedSprite2D
