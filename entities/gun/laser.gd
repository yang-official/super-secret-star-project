# Laser
# Parent for laser blasts that damage

extends Area2D

export var velocity = Vector2()

func _ready():
	set_process(true)
	yield(get_node("VisibilityNotifier2D"), "screen_exited")
	queue_free()
	pass

func _process(delta):
	translate(velocity * delta)
	pass