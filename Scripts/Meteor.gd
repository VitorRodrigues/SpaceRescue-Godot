extends Area2D

class_name Meteor

# ---- VARIABLES -----
export var speed = 300
export var rotation_speed = 2
export var life = 4
var rot = 0

# ---- PROCESSING -----
func _ready():
	add_to_group(Game.ENEMY_GROUP)
	randomize()
	rot = deg2rad(rand_range(-rotation_speed, rotation_speed))

func _physics_process(delta):
	rotate(rot)
	position += Vector2(0, speed * delta)
	
	if position.y > get_viewport_rect().end.y + 60:
		queue_free()
	pass

# ---- FUNCTIONS -----
func hit():
	queue_free()