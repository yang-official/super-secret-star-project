# Demo background
# Handles the background of the demo level

extends Sprite
const SCREEN_HEIGHT = 960
var scroll_speed = 120.0

func _process(delta):
	position += Vector2(0.0, scroll_speed * delta)
	if position.y >= SCREEN_HEIGHT:
		position.y -= SCREEN_HEIGHT + 320
