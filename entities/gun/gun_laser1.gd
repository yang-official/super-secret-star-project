extends Node2D

var can_shoot = true
const laser_one = preload("res://entities/gun/laser_one.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		shoot()

func shoot():
	var pos_front = $gun_position.get_global_position()
	if can_shoot:
		create_laser(pos_front)
		$gun_sound.play()
		can_shoot = false
		$reload_timer.start()

func _on_reload_timer_timeout():
	can_shoot = true

func create_laser(pos):
	var stage_node = get_parent()
	var laser = laser_one.instance()
	laser.set_position(pos)
	stage_node.add_child(laser)
	pass
