extends StaticBody2D

var node = ClassType.new()
node.set_name("node")
add_child(node)

var scene = load("res://scenes/MyScene.tscn")
var scene_instance = scene.instance()
scene_instance.set_name("scene")
add_child(scene_instance)
