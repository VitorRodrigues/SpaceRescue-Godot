extends Node2D

var pre_enemy = preload("res://Prefabs/EnemyPath.tscn")

func _ready():
	randomize_timer()

func randomize_timer():
	$Timer.wait_time = rand_range(2, 5)
	pass

func _on_Timer_timeout():
	randomize_timer()
	spawn_enemy()
	pass # Replace with function body.

func spawn_enemy():
	var enemy = pre_enemy.instance()
	Game.get_camera().add_child(enemy)
	