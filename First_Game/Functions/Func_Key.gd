extends Area2D

onready var key = get_node("../../Characters/Player")

func _on_Key_body_entered(body):
	if body == get_node("../../Characters/Player"):
		key.search = 1
		get_node("../../Labels/Search").show()
	
func _process(_delta):
	if Input.is_action_just_pressed("Interact") and key.search == 1:
		key.key_score = 1
		get_node("Sprite").show()
		get_node("../../Labels/Search").hide()
		get_node("../../Labels/Found_key").show()

func _on_Key_body_exited(body):
	if key.key_score == 0 and body == get_node("../../Characters/Player"):
			key.search = 0
			get_node("Sprite").hide()
			get_node("../../Labels/Search").hide()
	elif key.key_score == 1 and body == get_node("../../Characters/Player"):
			get_node("../../Labels/Search").hide()
			get_node("../../Labels/Found_key").hide()
			queue_free()
