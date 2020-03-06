extends RichTextLabel

# var dialog = ["Hey! This is a placeholder!", "Hey, this is part two!"]
var page = 0

var dialogue_file_path = "res://assets/text/dialogue.json"
var dialogue : Dictionary = load_dialogue(dialogue_file_path)

func _ready():
	var dialogue : Dictionary = load_dialogue(dialogue_file_path)
	set_bbcode(dialogue[page]["text"])
	set_visible_characters(0)
	set_process_input(true)

func load_dialogue(file_path) -> Dictionary:
	# Parses JSON file and returns it as a dictionary
	var file = File.new()
	assert file.file_exists(file_path)
	file.open(file_path, file.READ)
	var dialogue = parse_json(file.get_as_text())
	assert dialogue.size() > 0
	return dialogue

func _input(event):
	if event is InputEventKey and event.get_scancode() == KEY_SPACE && event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size() - 1:
				page += 1
				set_bbcode(dialogue[page]["text"])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
