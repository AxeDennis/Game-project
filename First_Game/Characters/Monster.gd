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
		velocity = (target - position).normalized() * move_speed
		velocity = move_and_slide(velocity)
	if state == 1:
		print(path)
		move_speed = 150
		var move_distance : int = move_speed * delta
		move_along_path(move_distance)
		if hide.Hide == 2:
			state = 0
			
func move_along_path(distance : float) -> void:
	var start_point = position 
	for i in range(path.size()):
		var distance_to_next = start_point.distance_to(path[1])
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			break
		elif path.size() == 1 && distance > distance_to_next:
			position = path[0]
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
		
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
