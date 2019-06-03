extends Area2D

export var value = 2
var speed = 150
func _process(delta):
	position += Vector2(0, speed) * delta
	
	if position.y > get_viewport_rect().end.y - 30:
		remove()
	

func _on_Area2D_area_entered(area):
	area.change_weapon(value)
	remove()

func remove():
	queue_free()