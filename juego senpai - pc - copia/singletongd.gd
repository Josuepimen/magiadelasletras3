extends Node

class_name SingletonScore

var score = 0
var scene_changed = false

func _ready():
	pass

func increment_score(amount):
	score += amount

func reset_score():
	score = 0

func add_points(points):
	increment_score(points)

func _on_singletonscore_singletonready():
	if score >= 5:
		reset_score()


