extends KinematicBody2D

var life = 100
export var speed = 600
var beam_prefab
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	beam_prefab = preload("res://Prefabs/Fire.tscn")
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		fire("GunLeft/FirePosition")
		fire("GunRight/FirePosition")
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed
	else:
		motion.x = 0
	
	motion = move_and_slide(motion)
	pass
	
func fire(node: NodePath):
	var fire = beam_prefab.instance()
	fire.position = get_node(node).global_position
	get_parent().add_child(fire)
