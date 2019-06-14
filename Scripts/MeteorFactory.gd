extends Node

func buildMeteor(value):
	value = value % get_child_count()
	return get_children()[value].duplicate()
	
func buildRandomMeteor():
	return buildMeteor(randi() % get_child_count())
