extends Label

export var score = 0 setget set_score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_score(new_score):
	score = new_score
	self.text = str(score)
