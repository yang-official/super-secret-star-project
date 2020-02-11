# flare animation

extends Sprite

func _ready():
	get_node("AnimationPlayer").play("fade")
	yield(get_node("AnimationPlayer"), "finished")
	queue_free()
	pass

