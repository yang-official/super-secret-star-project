extends Area2D

export var velocity = Vector2()

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	pass
