extends Control




@export var message : RichTextLabel
@export var total_label: RichTextLabel
@export var money_needed: RichTextLabel
@export var nights: RichTextLabel
@export var progress_bar: ProgressBar

var total: float = 0

var messages: Array[String] = [

	"you should prob invest some of that",
	"good haul",
	"you have how much dept!?",
	"keep the change",
	"stonks",
	"cash cash money"
	]

func _ready() -> void:
	total_label.text = str(Global.money)
	message.text = messages.pick_random()
	nights.text = "nights: " + str(Global.nights)
	money_needed.text = "money needed: " + str(Global.needed_total)


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		total += delta * 2
	else:
		total = 0
	progress_bar.value = total * 100
	if progress_bar.value >= 100:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
