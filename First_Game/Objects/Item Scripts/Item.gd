extends Area2D
		
onready var PlayerBody = get_node("../../Characters/Player")
onready var PlayerMove = get_node("../../Characters/Player")
		
func _process(_delta):
	if Input.is_action_just_pressed("Interact") and PlayerBody.BodyInArea == 1:
		PlayerBody.BodyInArea = 2
	elif Input.is_action_just_pressed("Interact") and PlayerBody.BodyInArea == 2:
		PlayerBody.BodyInArea = 1
