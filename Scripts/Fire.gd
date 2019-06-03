extends Area2D


class_name Fire
# Declare member variables here. Examples:
export var power = 50
export var speed = 600

func _process(delta):
	if position.y < -100:
		queue_free()

func _physics_process(delta):
	position += Vector2(0, -speed * delta)
	pass