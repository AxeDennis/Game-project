extends KinematicBody2D

onready var hide = get_node("../../Player")

var state = 0
var move_speed
export (NodePath) var patrol_path
var patrol_points
var patrol_index = 5
var velocity = Vector2.ZERO
var player = null

func _ready():
	if patrol_path:
		patrol_points = get_node(patrol_path).curve.get_baked_points()
		#vector2get_closest_point and poolvector2array
func _physics_process(delta):
	if state == 0:
		move_speed = 50
		var target = patrol_points[patrol_index]
		if position.distance_to(target) <= 1:
        	patrol_index = wrapi(patrol_index + 1, 0, patrol_points.size())
        	target = patrol_points[patrol_index]
		velocity = (target - position).normalized() * move_speed
		velocity = move_and_slide(velocity)
	if state == 1:
		move_speed = 150
		player
		velocity = position.direction_to(player.position) * move_speed
		velocity = move_and_slide(velocity)
		if hide.Hide == 2:
			state = 0

func _on_Detectradius_body_entered(body):
	if body == get_node("../../Player"):
		state = 1
		player = body

func _on_Detectradius_body_exited(body):
	if body == get_node("../../Player"):
		state = 0
		player = null
