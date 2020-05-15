extends KinematicBody2D
		
var BodyInArea = 0
var Hide = 0
var key_score = 0
var door = 0
var search = 0
var move_speed = 250
		
func _ready():
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)
		
func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * move_speed * delta)
		
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)


func _on_Area2D_body_entered(body):
	if body == get_node("../Monsters/Monster"):
		queue_free()
