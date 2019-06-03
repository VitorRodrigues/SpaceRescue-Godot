extends Node

const ENEMY_GROUP = "enemy"

var score = 0 setget setScore
var lives = 3 setget setLives

signal score_changed
signal lives_changed

func _ready():
	randomize()

func get_camera():
	return get_tree().root.get_node("main").get_node("Camera")

func addScore(value):
	self.score += value

func setScore(value):
	if value > 0:
		score = value
		emit_signal("score_changed")

func setLives(value):
	lives = value
	emit_signal("lives_changed")
	if lives < 0:
		endGame()

func endGame():
	restartGame()
	pass
	
func restartGame():
	self.lives = 4
	self.score = 0
	get_tree().reload_current_scene()