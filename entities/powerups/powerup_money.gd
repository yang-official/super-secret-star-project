# Powerup to restore HP

extends "res://entities/powerups/powerup.gd"

func _ready():
	connect("area_entered", self, "_on_area_entered")
	pass

func _on_area_entered(other):
	if other.is_in_group("player"):
		other.money += 10
		queue_free()
