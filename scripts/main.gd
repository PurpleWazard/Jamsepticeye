extends Node2D


var guard_scene = preload("res://scenes/guard.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:


	if Global.nights > 0:
		var number_guards =  Global.nights
		print(number_guards)
		for i in number_guards:
			var guard = guard_scene.instantiate()
			add_child(guard)
			guard.position = Vector2(300, 200)


	Global.needed_total += randi_range(6000, 15000)
	Global.time += 5
	$Timer.timeout.connect(timeout)
	$Timer.start(Global.time)


func _process(delta: float) -> void:
	$CanvasLayer/Label.text = str(int($Timer.time_left))

func timeout():
	if Global.money >= Global.needed_total:
		Global.nights += 1
		get_tree().change_scene_to_file("res://scenes/results.tscn")
	else:
		Global.nights = 0
		Global.money = 0
		Global.needed_total = 0
		Global.time = 25
		get_tree().change_scene_to_file("res://scenes/death.tscn")
