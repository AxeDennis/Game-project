extends Area2D

onready var DoorOpen = get_node("../../Characters/Player")

func _on_Func_Door_body_entered(body):
	if body == get_node("../../Characters/Player"):
		DoorOpen.door = 1
		get_node("../../Labels/Open_door").show()

func _process(_delta):
	if Input.is_action_just_pressed("Interact") and DoorOpen.key_score == 1 and DoorOpen.door == 1:
		get_node("../../Assets/Door").queue_free()
		queue_free()
		get_node("../../Labels/Open_door").hide()
	elif Input.is_action_just_pressed("Interact") and DoorOpen.key_score == 0 and DoorOpen.door == 1:
		get_node("../../Labels/Open_door").hide()
		get_node("../../Labels/Locked").show()
		
func _on_Func_Door_body_exited(body):
	if body == get_node("../../Characters/Player"):
		DoorOpen.door = 0
		get_node("../../Labels/Open_door").hide()
		get_node("../../Labels/Locked").hide()
