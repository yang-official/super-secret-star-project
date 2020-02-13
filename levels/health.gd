extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	var hp = get_node("../../Player").get("hp")
	self.text = str(hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player_hp_updated(hp):
	var health = hp
	self.text = str(health)
