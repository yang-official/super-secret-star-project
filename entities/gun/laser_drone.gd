# Drone Laser level one

extends "res://entities/gun/laser.gd"

func _ready():
	connect("area_entered", self, "_on_area_entered")
	pass

func _on_area_entered(other):
	if other.is_in_group("player"):
		other.HP -= 1
		queue_free()
	pass