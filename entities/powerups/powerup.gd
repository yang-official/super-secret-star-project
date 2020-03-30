# powerups

extends Area2D

export var velocity = Vector2(0, 200)

func _ready():
	pass # Replace with function body.

func _process(delta):
	translate(velocity * delta)
	if get_position().y - 20 >= get_viewport_rect().size.y:
		queue_free()
	pass
	
func _on_area_entered(other):
	if other.is_in_group("player"):
		$acquire_sound.play()
		other.hp += 1
		queue_free()
