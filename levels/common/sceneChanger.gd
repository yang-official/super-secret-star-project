extends CanvasLayer

signal scene_changed()

onready var animation_player = $AnimationPlayer
onready var black = $Control/black

func change_scene(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("modulate")
	yield(animation_player, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	get_tree().change_scene(path)
	animation_player.play_backwards("modulate")
	yield(animation_player, "animation_finished")
	emit_signal("scene_changed")
	
