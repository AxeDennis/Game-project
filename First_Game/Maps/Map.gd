extends Node2D
		
func _ready():
	set_camera_limits()
		
func set_camera_limits():
	var map_limits = $Floor.get_used_rect()
	var map_cellsize = $Floor.cell_size
	$Characters/Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Characters/Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Characters/Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Characters/Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y