extends "res://Objects/Item Scripts/Item.gd"
		
func _on_Note_body_entered(_body):
	PlayerBody.BodyInArea = 1
	get_node("../../Labels/Read").show()
		
func _process(_delta):
		if PlayerBody.BodyInArea == 2:
			get_node("Sprite2").show()
			get_node("../../Labels/Read").hide()
			PlayerMove.move_speed = 0
		elif PlayerBody.BodyInArea == 1:
			get_node("Sprite2").hide()
			get_node("../../Labels/Read").show()
			PlayerMove.move_speed = 250
		
func _on_Note_body_exited(_body):
	PlayerBody.BodyInArea = 0
	get_node("../../Labels/Read").hide()