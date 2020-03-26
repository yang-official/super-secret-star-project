extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	var money = get_node("../../Player").get("money")
	self.text = str(money)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player_money_updated(money):
	self.text = str(money)
