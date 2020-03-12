extends Area2D
		
onready var PlayerHide = get_node("../../Characters/Player")
onready var PlayerMove = get_node("../../Characters/Player")
		
func _on_Closet_body_entered(_body):
	PlayerHide.Hide = 1
	get_node("Node2D").show()
		
func _process(_delta):
	if Input.is_action_just_pressed("Interact") and PlayerHide.Hide == 1:
		get_node("../../Characters/Player").hide()
		get_node("Node2D").hide()
		PlayerMove.move_speed = 0
		PlayerHide.Hide = 2
	elif Input.is_action_just_pressed("Interact") and PlayerHide.Hide == 2:
		get_node("../../Characters/Player").show()
		PlayerMove.move_speed = 250
		PlayerHide.Hide = 1
		
func _on_Closet_body_exited(_body):
	PlayerHide.Hide = 0
	get_node("Node2D").hide()