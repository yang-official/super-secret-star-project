# Player.gd
# Controls the player ship

extends Area2D

const laser_one = preload("res://entities/gun/laser_one.tscn")
var can_shoot = true

func _ready():
	set_process(true)
	pass

func _process(delta):
	# tracking mouse
	var motion_x = (get_global_mouse_position().x - get_position().x) * 0.2
	var motion_y = (get_global_mouse_position().y - get_position().y) * 0.2
	translate(Vector2(motion_x, motion_y))
	
	# clamp to view
	var view_size = get_viewport_rect().size
	var pos = get_position()
	pos.x = clamp(pos.x, 0+16, view_size.x - 16)
	pos.y = clamp(pos.y, 0+16, view_size.y - 16)
	set_position(pos)
	
	# shooting
	if Input.is_key_pressed(KEY_SPACE) and can_shoot:
		shoot()
		get_node("guns/reload_timer").start()

func shoot():
	var pos_front = get_node("guns/front").get_global_position()
	create_laser(pos_front)
	can_shoot = false
	pass

func _on_reload_timer_timeout():
	can_shoot = true

func create_laser(pos):
	var stage_node = get_parent()
	var laser = laser_one.instance()
	laser.set_position(pos)
	stage_node.add_child(laser)
	pass