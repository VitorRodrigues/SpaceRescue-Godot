extends Area2D
class_name Enemy

export var life = 500
export var score = 10

func _ready():
	add_to_group(Game.ENEMY_GROUP)
	_startEnemy()
	pass

func _startEnemy():
	pass

func hit(power):
	life -= power
	if life <= 0:
		Game.score += score
		remove_from_group(Game.ENEMY_GROUP)
		destroy()
	else:
		_animateHit()

func _animateHit():
	pass
	
func destroy():
	die()

func die():
	Game.addScore(score)
	queue_free()
	pass
