extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$player/Camera2D.enabled = false
	$intro.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func intro_done() -> void:
	$intro.hide()
	$intro.queue_free()
	$player/Camera2D.enabled = true
