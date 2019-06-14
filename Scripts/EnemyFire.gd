extends Area2D

# ---- VARIABLES -----
export var power = 250
export var speed = 400
export var rotation_angle = 100
# ---- PROCESSING -----
func _ready():
	add_to_group(Game.ENEMY_SHOT)
#	$Audio.play()
	pass

func _process(delta):
	if position.y > get_viewport_rect().end.y + 100:
		queue_free()

func _physics_process(delta):
	translate(Vector2(0, speed * delta))
	rotate(deg2rad(rotation_angle) * delta)
	pass

# ---- COLLISIONS -----
func _on_fire_area_entered(area):
	if area.is_in_group(Game.PLAYER_GROUP):
		area.hit(power)
		die()

func hit(power):
	die()

# ---- FUNCTIONS -----
func die():
	queue_free()
