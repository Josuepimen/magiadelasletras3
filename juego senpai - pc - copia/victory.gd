extends Control
@onready var anim = $AnimationPlayer
@onready var audio_stream_player = $AudioStreamPlayer

@onready var animated_sprite_2d_2 = $TextureRect2/AnimatedSprite2D2
@onready var animated_sprite_2d_3 = $TextureRect2/AnimatedSprite2D3
@onready var animated_sprite_2d_4 = $TextureRect2/AnimatedSprite2D4
@onready var animated_sprite_2d_5 = $TextureRect2/AnimatedSprite2D5
@onready var animated_sprite_2d = $TextureRect2/AnimatedSprite2D
@onready var animation_player_2 = $AnimationPlayer2
@onready var animation_player_3 = $AnimationPlayer3
@onready var animation_player_4 = $AnimationPlayer4
@onready var animation_player_5 = $AnimationPlayer5
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button/AnimatedSprite2D3.play()

	audio_stream_player.play()
	animated_sprite_2d.play()
	animated_sprite_2d_2.play()
	animated_sprite_2d_3.play()
	animated_sprite_2d_4.play()
	animated_sprite_2d_5.play()
	$TextureRect2/AnimatedSprite2D6.play()
	await get_tree().create_timer(11.26).timeout
	animation_player.play("new_animation")
	$TextureRect2/Label6.visible = true
	await get_tree().create_timer(1.2).timeout
	animation_player_2.play("new_animation")
	$TextureRect2/Label3.visible = true
	await get_tree().create_timer(0.32).timeout
	animation_player_3.play("new_animation")
	$TextureRect2/Label5.visible = true
	await get_tree().create_timer(0.88).timeout
	animation_player_4.play("new_animation")
	$TextureRect2/Label4.visible = true
	await get_tree().create_timer(1.5).timeout
	animation_player_5.play("new_animation")
	$TextureRect2/Label2.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().quit()
