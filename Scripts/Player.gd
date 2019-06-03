extends Area2D

var life = 100
export var speed = 600
var beam_prefab

# Called when the node enters the scene tree for the first time.
func _ready():
	beam_prefab = preload("res://Prefabs/Fire.tscn")
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		fire("GunLeft/FirePosition")
		fire("GunRight/FirePosition")
	pass
	
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
	pass

func fire(node: NodePath):
	var fire = beam_prefab.instance()
	fire.position = get_node(node).global_position
	get_parent().add_child(fire)

func hit():
	queue_free()
	