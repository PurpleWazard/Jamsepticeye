extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()
	play()
	speed_scale = 0.8



func _on_animation_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/ui.tscn")
