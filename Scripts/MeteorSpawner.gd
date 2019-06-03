extends Node2D

var meteor_preload = preload("res://Prefabs/Meteor.tscn")
var powerup_preload = preload("res://Prefabs/PowerUp.tscn")
var wait_time = 2

func _ready():
	# Calls set_process because type "node"
	# is not registered to be updated
	set_process(true)

func _process(delta):
	if wait_time > 0:
		wait_time -= delta
	else:
		if (randi() % 100 >= 75):
			spawnPowerUp()
		else:
			spawnMeteor()
			
func spawnPowerUp():
	var pup = powerup_preload.instance()
	var maxX = get_viewport_rect().end.x - 30
	pup.position = Vector2(rand_range(30, maxX), -60)
	get_parent().add_child(pup)
	
func spawnMeteor():
	wait_time = rand_range(0.3, 1)
	var meteor = meteor_preload.instance()
	var maxX = get_viewport_rect().end.x - 30
	meteor.speed = rand_range(150, 300)
	meteor.position = Vector2(rand_range(30, maxX), -60)
	get_parent().add_child(meteor)