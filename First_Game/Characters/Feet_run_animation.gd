extends AnimatedSprite


func _input(event):
	if Input.is_action_pressed("move_right"):
		animation.show()
	else:
		hide()
