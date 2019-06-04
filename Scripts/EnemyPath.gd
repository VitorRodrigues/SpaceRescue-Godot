extends Path2D

onready var follow = $Follow

var speed = 200

func _ready():
	curve = Resources.get_random_path()
	set_process(true)
	pass
	
func _process(delta):
	follow.offset += speed * delta
	
	if follow.unit_offset >= 1:
		queue_free()
	pass