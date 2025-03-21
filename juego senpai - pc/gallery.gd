extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_nivel_1_pressed():
	get_tree().change_scene_to_file("res://escenas/level.tscn")
	
func _on_nivel_2_pressed():
	get_tree().change_scene_to_file("res://escenas/seleccionar.tscn")


func _on_nivel_3_pressed():
	get_tree().change_scene_to_file("res://Seleccionar2.tscn")


func _on_nivel_4_pressed():
	get_tree().change_scene_to_file("res://seleccionar3.tscn")
