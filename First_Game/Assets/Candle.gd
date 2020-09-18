extends Sprite

func _on_Light_timer_timeout():
	$Tween.interpolate_property($Light2D, "energy", 
	$Light2D.energy, rand_range(0.7, 1.3), 0.8,
	Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	
	$Tween.start()
