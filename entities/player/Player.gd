# Player.gd
# Controls the player ship

extends Area2D

export var MOVE_SPEED = 400
export var HP = 10 setget set_HP
const laser_one = preload("res://entities/gun/laser_one.tscn")
const explosion = preload("res://entities/effects/explosion.tscn")
var can_shoot = true

signal hp_change

func _ready():
	set_process(true)
	add_to_group("player")
	pass

func _process(delta):
	# tracking mouse controls
	#var motion_x = (get_global_mouse_position().x - get_position().x) * 0.2
	#var motion_y = (get_global_mouse_position().y - get_position().y) * 0.2
	#translate(Vector2(motion_x, motion_y))
	
	# Keyboard Controls
	var input_dir = Vector2()
	if Input.is_action_pressed("ui_up"):
		input_dir.y -= 1.0
	if Input.is_action_pressed("ui_down"):
		input_dir.y += 1.0
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1.0
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1.0
	position += (delta * MOVE_SPEED) * input_dir
	
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

# Health
func set_HP(new_value):
	HP = new_value
	emit_signal("hp_change", HP)
	if HP <= 0:
		create_explosion()
		queue_free()
	pass

# Shooting front cannon
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

func create_explosion():
	var stage_node = get_parent()
	var explosion_instance = explosion.instance()
	explosion_instance.position = position
	stage_node.add_child(explosion_instance)
	pass