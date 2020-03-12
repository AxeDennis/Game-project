extends Sprite

func _ready():
	pass



func _on_Light_timer_timeout():
	$Tween.interpolate_property($Light2D, "energy", 
	$Light2D.energy, rand_range(0.8, 1.2), 0.8,
	Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	
	$Tween.start()