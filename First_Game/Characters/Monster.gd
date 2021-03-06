extends KinematicBody2D
		
onready var hide = get_node("../../Player")
onready var test = get_node("../../..")
var state = 0
var move_speed
export (NodePath) var patrol_path
var patrol_points
var patrol_index = 5
var velocity = Vector2.ZERO
var player = null
var path = PoolVector2Array() setget set_path
		
func _ready():
	if patrol_path:
		patrol_points = get_node(patrol_path).curve.get_baked_points()
		
func _process(delta: float) -> void:
		
	rotation = velocity.angle()
	if state == 0:
		move_speed = 50
		var target = patrol_points[patrol_index]
		
		if position.distance_to(target) <= 1:
			patrol_index = wrapi(patrol_index + 1, 0, patrol_points.size())
			target = patrol_points[patrol_index]
		test._set_target(target)
		velocity = (path[1] - position).normalized() * move_speed
		move_and_slide(velocity)
	if state == 1:
		test.goal = hide.global_position
		move_speed = 150
		var target = path[0]
		if position.distance_to(target) <= 1:
			target = path[1]
		velocity = (target - position).normalized() * move_speed
		move_and_slide(velocity)
		
		if hide.Hide == 2:
			state = 0
		
		
		
func set_path(value : PoolVector2Array) -> void:
		path = value
		if value.size() == 0:
			return
		set_process(true)
		
		
		
func _on_Detectradius_body_entered(body):
	if body == get_node("../../Player"):
		state = 1
		player = body
		
		
func _on_Detectradius_body_exited(body):
	if body == get_node("../../Player"):
		state = 0
		player = null
		
