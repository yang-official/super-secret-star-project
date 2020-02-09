# Spawn Enemies
# Handles the spawning of enemy entities

extends Node2D

const asteroid = preload("res://entities/enemy/Asteroid.tscn")

func _ready():
	spawn()
	pass

func spawn():
	while true:
		randomize()
		var enemy = asteroid.instance()
		var pos = Vector2()
		pos.x = rand_range(0+50, get_viewport().get_visible_rect().size.x - 50)
		pos.y = 0 - 40
		enemy.set_position(pos)
		get_node("container").add_child(enemy)
		yield(get_tree().create_timer(rand_range(1.5, 2.25)), "timeout")
	pass