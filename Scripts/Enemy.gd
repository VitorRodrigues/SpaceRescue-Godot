extends Area2D

class_name Enemy

export var life = 500

var fire = preload("res://Prefabs/EnemyFire.tscn")

func _ready():
	add_to_group(Game.ENEMY_GROUP)
	$Sprite.texture = Resources.get_random_enemy_texture()
	pass

func _process(delta):
	pass

func fire():
	var shot = fire.instance()
	shot.global_position = $GunPosition.global_position
	Game.get_camera().add_child(shot)

func hit(power):
	life -= power
	if life <= 0:
		die()
	pass
	
func die():
	Game.addScore(100)
	queue_free()
	pass

func _on_Timer_timeout():
	fire()
