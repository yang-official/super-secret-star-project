extends Control

onready var hpbar = $HPbar

func _on_hp_updated(hp):
	hpbar.value = hp
	
func _on_max_hp_updated(max_hp):
	hpbar.max_value = max_hp

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Player_hp_updated(hp):
	_on_hp_updated(hp)

func _on_Drone_hp_updated(hp):
	_on_hp_updated(hp)


func _on_Player_max_hp_updated(max_hp):
	_on_max_hp_updated(max_hp)
