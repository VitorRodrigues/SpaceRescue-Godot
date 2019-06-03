extends Area2D

class_name Weapon

var ship: Node2D
var beam_prefab

func _init(ship: Node2D):
	self.ship = ship
	beam_prefab = preload("res://Prefabs/Fire.tscn")
	pass

func updateGun(delta):
	pass