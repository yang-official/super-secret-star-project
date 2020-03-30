extends Control

var page = "0"
var dialogue_file_path = "res://assets/text/demo_dialogue.json"

func _ready():
	var dialogue = load_dialogue(dialogue_file_path)
	$Text.set_bbcode(dialogue[page]["text"])
	$Name.set_text(dialogue[page]["name"])
	$Text.set_visible_characters(0)
	set_process_input(true)

func load_dialogue(file_path) -> Dictionary:
	# Parses JSON file and returns it as a dictionary
	var file = File.new()
	assert file.file_exists(file_path)
	file.open(file_path, file.READ)
	var file_text = file.get_as_text()
	var dialogue = parse_json(file_text)
	assert dialogue.size() > 0
	return dialogue

func _input(event):
	var dialogue = load_dialogue(dialogue_file_path)
	if event is InputEventKey and event.get_scancode() == KEY_SPACE && event.is_pressed():
		if $Text.get_visible_characters() > $Text.get_total_character_count():
			if int(page) < dialogue.size() - 1:
				page = str(int(page) + 1)
				$Text.set_bbcode(dialogue[page]["text"])
				$Name.set_text(dialogue[page]["name"])
				$Text.set_visible_characters(0)
		else:
			$Text.set_visible_characters($Text.get_total_character_count())

func _on_Timer_timeout():
	$Text.set_visible_characters($Text.get_visible_characters()+1)
