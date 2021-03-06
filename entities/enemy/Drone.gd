# Drone
# Handles behavior of simple drone enemy
extends "res://entities/enemy/Enemy.gd"

const laser_drone = preload("res://entities/gun/laser_drone.tscn")
var can_shoot = true
var view_size = get_viewport_rect().size
const drops = [
	preload("res://entities/powerups/powerup_hp.tscn"),
	preload("res://entities/powerups/powerup_money.tscn")
]

func _ready():
	pass

func _process(delta):
	var view_size = get_viewport_rect().size
	if get_position().x < 0 + 40:
		velocity.x = abs(velocity.x)
	if get_position().x > view_size.x - 40:
		velocity.x = -velocity.x
	if can_shoot:
		$enemy_gun_sound.play()
		shoot()

func set_HP(new_value):
	HP = new_value
	if HP <= 0:
		create_explosion()
		spawn_drop()
		queue_free()
	pass

func shoot():
	var pos = get_node("gun").get_global_position()
	create_laser(pos)
	can_shoot = false
	get_node("reload_timer").start()

func _on_reload_timer_timeout():
	can_shoot = true
	
func create_laser(pos):
	var stage_node = get_parent()
	var laser = laser_drone.instance()
	laser.set_position(pos)
	stage_node.add_child(laser)
	
func spawn_drop():
	var pos = get_node("gun").get_global_position()
	var stage_node = get_parent()
	randomize()
	var i = randi() % 3
	if i < 2:
		var drop = drops[i].instance()
		drop.set_position(pos)
		stage_node.add_child(drop)
