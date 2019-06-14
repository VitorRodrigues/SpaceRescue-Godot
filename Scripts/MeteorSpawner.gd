extends Node2D

var factory_preload = preload("res://Prefabs/MeteorFactory.tscn")
var powerup_preload = preload("res://Prefabs/PowerUp.tscn")
var wait_time = 2
var factory
func _ready():
	factory = factory_preload.instance()

			
func spawnPowerUp():
	var pup = powerup_preload.instance()
	var maxX = get_viewport_rect().end.x - 30
	pup.position = Vector2(rand_range(30, maxX), -60)
	get_parent().add_child(pup)
	
func spawnMeteor():
	var meteor = factory.buildRandomMeteor()
	var maxX = get_viewport_rect().end.x - 30
	meteor.speed = rand_range(150, 300)
	meteor.position = Vector2(rand_range(30, maxX), -60)
	get_parent().add_child(meteor)
	


func _on_Timer_timeout():
	$Timer.wait_time = rand_range(1.4, 3)
	spawnMeteor()
	pass # Replace with function body.
