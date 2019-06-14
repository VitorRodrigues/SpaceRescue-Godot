extends Enemy

class_name Meteor

# ---- VARIABLES -----
export var speed = 300
export var rotation_speed = 20

var rot = 0
var alive = true

# ---- PROCESSING -----

func _ready():
	add_to_group(Game.ENEMY_GROUP)
	randomize()
	rot = rand_range(-rotation_speed, rotation_speed)

func _physics_process(delta):
	rotate(deg2rad(rot * delta))
	if alive:
		position += Vector2(0, speed * delta)
	
	if position.y > get_viewport_rect().end.y + 60:
		die()
	pass

# ---- FUNCTIONS -----
func _animateHit():
	$AnimPlayer.play("hit")

func destroy():
	alive = false
	$AnimPlayer.play("destroy")
	Game.get_camera().shake()
	$Audio.play()
	
func die():
	queue_free()