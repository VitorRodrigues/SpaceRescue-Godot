extends Weapon

class_name FastWeapon

var shot_interval = 0.1
var last_shot = 0

func _init(ship).(ship):
	beam_prefab = preload("res://Prefabs/GreenShot.tscn")
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

func updateGun(delta):
	if last_shot > 0:
		last_shot -= delta