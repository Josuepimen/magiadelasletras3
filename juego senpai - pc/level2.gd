extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Regresitotito/AnimatedSprite2D.play()
	$AnimatedSprite2D.play()
	$"2".play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_regresitotito_pressed():
	singletonscore.reset_score()
	get_tree().change_scene_to_file("res://escenasentados2.tscn")
