extends Enemy

var fire = preload("res://Prefabs/EnemyFire.tscn")

func _startEnemy():
	$Sprite.texture = Resources.get_random_enemy_texture()
	pass

func fire():
	var shot = fire.instance()
	shot.global_position = $GunPosition.global_position
	Game.get_camera().add_child(shot)

func _on_Timer_timeout():
	fire()
