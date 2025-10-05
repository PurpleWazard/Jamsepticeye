extends Control


@export var progress_bar: ProgressBar
@export var label: RichTextLabel

var death_messages: Array[String] = [
"I told you not get get caught",
"I cant help you now",
"it looks like your debt got ya",
":(",
"welp now what",
"skill issue?",
"hi hungry im dad",
"sneek not 100",
"risk it for the biscuit"
]

var total: float = 0
func _ready() -> void:
	label.text = death_messages.pick_random()

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		total += delta * 2
	else:
		total = 0
	progress_bar.value = total * 100
	if progress_bar.value >= 100:
		get_tree().change_scene_to_file("res://scenes/ui.tscn")
