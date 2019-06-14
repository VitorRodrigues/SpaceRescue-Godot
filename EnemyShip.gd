extends Enemy

var fire = preload("res://Prefabs/EnemyFire.tscn")

signal ship_destroyed

func _startEnemy():
	$Sprite.texture = Resources.get_random_enemy_texture()
	pass

func fire():
	var shot = fire.instance()
	shot.global_position = $GunPosition.global_position
	Game.get_camera().add_child(shot)
	$shot_audio.play()

func _on_Timer_timeout():
	fire()

func destroy():
	$Sprite.hide()
	$Timer.stop()
	$Explosion.show()
	$Explosion/Anim.play("Explode")
	$explosion_audio.play()
	emit_signal("ship_destroyed")
	
