# Spawn Drops
# Handles the spawning of pickups

extends Node2D

const drops = [
	preload("res://entities/powerups/powerup_hp.tscn")
]
func _ready():
#	spawn()
	pass

func spawn():
	while true:
		randomize()
		var drop = drops[0].instance()
		var pos = Vector2()
		pos.x = rand_range(0+50, get_viewport().get_visible_rect().size.x - 50)
		pos.y = 0 - 40
		drop.set_position(pos)
		get_node("container").add_child(drop)
		yield(get_tree().create_timer(rand_range(10.5, 12.25)), "timeout")
	pass