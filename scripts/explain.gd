extends Control


# Called when the node enters the scene tree for the first time.
@export var progress_bar: ProgressBar

var total: float = 0
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		total += delta * 2
	else:
		total = 0
	progress_bar.value = total * 100
	if progress_bar.value >= 100:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
