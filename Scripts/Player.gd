extends Area2D

var life = 100
export var speed = 600

var weapon: Weapon

# Called when the node enters the scene tree for the first time.
func _ready():
	weapon = SimpleWeapon.new(self)
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		weapon.shot()
	weapon.update(delta)
	
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

func change_weapon(value):
	if value == 1:
		weapon = SimpleWeapon.new(self)
	elif value == 2:
		weapon = FastWeapon.new(self)

func hit():
	queue_free()

class Weapon:
	var ship: Node2D
	var beam_prefab = preload("res://Prefabs/Fire.tscn")
	
	func _init(ship: Node2D):
		self.ship = ship
		pass
	

class SimpleWeapon extends Weapon:

	var shot_interval = 0.3
	var last_shot = 0
	
	func _init(ship).(ship):
		pass
	
	func fire(node: Node):
		var fire = beam_prefab.instance()
		fire.position = node.global_position
		ship.get_parent().add_child(fire)
		
	func shot():
		if last_shot <= 0:
			fire(ship.get_node("GunLeft/FirePosition"))
			fire(ship.get_node("GunRight/FirePosition"))
			last_shot = shot_interval
	
	func update(delta):
		if last_shot > 0:
			last_shot -= delta
			
class FastWeapon extends Weapon:

	var shot_interval = 0.1
	var last_shot = 0
	
	func _init(ship).(ship):
		pass
		
	func fire(node: Node):
		var fire = beam_prefab.instance()
		fire.position = node.global_position
		ship.get_parent().add_child(fire)
		
	func shot():
		if last_shot <= 0:
			fire(ship.get_node("GunLeft/FirePosition"))
			fire(ship.get_node("GunRight/FirePosition"))
			last_shot = shot_interval
	
	func update(delta):
		if last_shot > 0:
			last_shot -= delta