extends Path2D

onready var follow = $Follow

var speed = 200

func _ready():
	curve = Resources.get_random_path()
	set_process(true)
	follow.get_node("Enemy").connect("ship_destroyed", self, "_on_ship_destroyed")
	pass
	
func _process(delta):
	follow.offset += speed * delta
	
	if follow.unit_offset >= 1:
		queue_free()
	pass

func _on_ship_destroyed():
	set_process(false)
	var timer = Timer.new()
	timer.start(1)
	timer.connect("timeout", self, "_on_ship_destroyed_time_timeout")
	add_child(timer)

func _on_ship_destroyed_timer_timeout():
	queue_free()