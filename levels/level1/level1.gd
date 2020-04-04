extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$level_music.play()
	pass # Replace with function body.

func _on_End_area_entered(other):
	if other.is_in_group("player"):
		$Menus/sceneChanger.change_scene("res://levels/demo_menu.tscn")
