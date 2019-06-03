extends Area2D

class_name Meteor

export var speed = 300
export var rotation_speed = 2
var rot = 0

func _ready():
	randomize()
	rot = deg2rad(rand_range(-rotation_speed, rotation_speed))

func _physics_process(delta):
	rotate(rot)
	position += Vector2(0, speed * delta)
	
	if position.y > get_viewport_rect().end.y + 60:
		queue_free()
	pass
