# Player.gd
# Controls the player ship

extends Area2D

func _ready():
	set_process(true)
	pass # Replace with function body.

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
