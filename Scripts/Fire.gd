extends Area2D
class_name Fire

# ---- VARIABLES -----
export var power = 250
export var speed = 600

# ---- PROCESSING -----
func _ready():
	$Audio.play()

func _process(delta):
	if position.y < -100:
		queue_free()

func _physics_process(delta):
	position += Vector2(0, -speed * delta)
	pass

# ---- COLLISIONS -----
func _on_fire_area_entered(area):
	if area.is_in_group(Game.ENEMY_GROUP):
		area.hit(power)
		hit()

# ---- FUNCTIONS -----
func hit():
	queue_free()
