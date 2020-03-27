extends Area2D

onready var PlayerHide = get_node("../../Characters/Player")
onready var PlayerMove = get_node("../../Characters/Player")

func _on_Func_Hide_body_entered(body):
	if body == get_node("../../Characters/Player"):
		PlayerHide.Hide = 1
		get_node("../../Labels/Hide").show()

func _process(delta):
	if Input.is_action_just_pressed("Interact") and PlayerHide.Hide == 1:
		get_node("../../Characters/Player").hide()
		get_node("../../Labels/Hide").hide()
		PlayerMove.move_speed = 0
		PlayerHide.Hide = 2
	elif Input.is_action_just_pressed("Interact") and PlayerHide.Hide == 2:
		get_node("../../Characters/Player").show()
		get_node("../../Labels/Hide").show()
		PlayerMove.move_speed = 250
		PlayerHide.Hide = 1

func _on_Func_Hide_body_exited(body):
	if body == get_node("../../Characters/Player"):
		PlayerHide.Hide = 0
		get_node("../../Labels/Hide").hide()