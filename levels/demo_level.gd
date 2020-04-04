extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$level_music.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_End_area_entered(other):
	if other.is_in_group("player"):
		$Menus/sceneChanger.change_scene("res://levels/demo_level.tscn")

