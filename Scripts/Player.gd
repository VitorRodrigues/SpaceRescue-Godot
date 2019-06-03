extends Area2D

var life = 100
export var speed = 600
var shot_interval = 0.3
var last_shot = 0
var beam_prefab

# Called when the node enters the scene tree for the first time.
func _ready():
	beam_prefab = preload("res://Prefabs/Fire.tscn")
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("fire") and last_shot <= 0:
		fire("GunLeft/FirePosition")
		fire("GunRight/FirePosition")
		last_shot = shot_interval
	elif last_shot > 0:
		last_shot -= delta
	
	var x = 0
	if Input.is_action_pressed("ui_left"):
		x += -speed
	elif Input.is_action_pressed("ui_right"):
		x += speed
	else:
		x = 0
	
	var newPos = position + Vector2(x, 0) * delta
	if newPos.x >= 45 and newPos.x <= get_viewport_rect().end.x - 45:
		position = newPos

func fire(node: NodePath):
	var fire = beam_prefab.instance()
	fire.position = get_node(node).global_position
	get_parent().add_child(fire)

func hit():
	queue_free()
	