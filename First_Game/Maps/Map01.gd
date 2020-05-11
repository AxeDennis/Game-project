extends "res://Maps/Map.gd"

onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D
onready var monster = get_node("Characters/Monsters/Monster")
onready var player = get_node("Characters/Player")
onready var goal = get_node("Characters/Player").global_position

func _process(delta):
	_set_target(goal)
	
func _set_target(target):
	var new_path : = nav_2d.get_simple_path(monster.global_position, target)
	line_2d.points = new_path
	monster.path = new_path
	var test = 1
