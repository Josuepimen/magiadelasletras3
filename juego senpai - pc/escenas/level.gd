extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$"1".play()
	$regresito/AnimatedSprite2D.play()
	$AnimatedSprite2D.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_regresito_pressed():
	singletonscore.reset_score()
	get_tree().change_scene_to_file("res://escenasentados2.tscn")

