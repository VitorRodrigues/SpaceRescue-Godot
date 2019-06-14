extends Area2D

var life = 100
export var speed = 600

var simple_gun = preload("res://Scripts/Guns/SimpleWeapon.gd")
var fast_gun = preload("res://Scripts/Guns/FastWeapon.gd")

var guns = [
	simple_gun.new(self),
	fast_gun.new(self),
]

var weapon

# Called when the node enters the scene tree for the first time.
func _ready():
	change_weapon(1)
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		weapon.shot()
	weapon.updateGun(delta)
	
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
	weapon = guns[value-1]

func die():
	queue_free()

func _on_ship_area_entered(area):
	if area.is_in_group(Game.ENEMY_GROUP):
		area.hit(9999)
		hit()
	elif area.is_in_group(Game.ENEMY_SHOT):
		area.queue_free()
		hit()

func hit():
	Game.lives -= 1