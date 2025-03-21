extends Area2D

var score = 0


func object_disappeared():
	score += 1 
	if score >= 5:
		get_tree().change_scene("res://uwu.tscn")
	else:
		$ObjectLabel.text= "Score:" + str(score)
		$ObjectLabel.show()
		hide()



