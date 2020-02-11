# Enemy
# Parent for entites that can damage or be damaged

extends Area2D

export var HP = 2 setget set_HP
export var velocity = Vector2()

func _ready():
	set_process(true)
	add_to_group("enemy")
	connect("area_entered", self, "_on_area_entered")
	pass

func _process(delta):
	translate(velocity * delta)
	if get_position().y - 40 >= get_viewport_rect().size.y:
		queue_free()
	pass

func set_HP(new_value):
	HP = new_value
	if HP <= 0:
		queue_free()
	pass

func _on_area_entered(other):
	if other.is_in_group("player"):
		other.HP -= 1
		queue_free()