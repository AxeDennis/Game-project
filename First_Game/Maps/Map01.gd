extends "res://Maps/Map.gd"

onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D
onready var monster = get_node("Characters/Monsters/Monster")
onready var player = get_node("Characters/Player")

func _process(delta):
	var new_path : = nav_2d.get_simple_path(monster.global_position, player.global_position)
	line_2d.points = new_path
	monster.path = new_path
	var test = 1
