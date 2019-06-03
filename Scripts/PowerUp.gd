extends Area2D

export var value = 2

func _on_Area2D_area_entered(area):
	area.change_weapon(value)
	queue_free()
