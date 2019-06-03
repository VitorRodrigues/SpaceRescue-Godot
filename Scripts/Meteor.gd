extends Area2D

class_name Meteor

# ---- VARIABLES -----
export var speed = 300
export var rotation_speed = 2
export var life = 400
var rot = 0
var alive = true

# ---- PROCESSING -----
func _ready():
	add_to_group(Game.ENEMY_GROUP)
	randomize()
	rot = deg2rad(rand_range(-rotation_speed, rotation_speed))

func _physics_process(delta):
	rotate(rot)
	if alive:
		position += Vector2(0, speed * delta)
	
	if position.y > get_viewport_rect().end.y + 60:
		die()
	pass

# ---- FUNCTIONS -----
func hit(power):
	life -= power
	if life <= 0:
		alive = false
		destroy()
	else:
		$AnimPlayer.play("hit")

func destroy():
	remove_from_group(Game.ENEMY_GROUP)
	$AnimPlayer.play("destroy")
	get_tree().root.get_node("main").get_node("Camera").shake()
	
func die():
	queue_free()