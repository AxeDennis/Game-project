extends Label

onready var show = get_node("../../Characters/Player")

func _process(_delta):
	if show.BodyInArea == 1:
		show()
	elif show.BodyInArea == 0:
		hide()