# Enemy
# Parent for entites that can damage or be damaged

extends Area2D

export var HP = 2 setget set_HP
export var velocity = Vector2()
const explosion = preload("res://entities/effects/explosion.tscn")
const drops = [
	preload("res://entities/powerups/powerup_hp.tscn")
]

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
		create_explosion()
		get_node("/root/demo_level/HUD/score").score += 5
		var drop = drops[0].instance()
		drop.set_position(get_position())
		#get_node("demo_level").add_child(drop)
		queue_free()
	pass

func _on_area_entered(other):
	if other.is_in_group("player"):
		other.hp -= 1
		create_explosion()
		queue_free()

func create_explosion():
	var stage_node = get_parent()
	var explosion_instance = explosion.instance()
	explosion_instance.position = position
	stage_node.add_child(explosion_instance)
	pass