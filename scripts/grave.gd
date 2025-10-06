extends Node2D

signal digging
signal stop_digging

var perm: bool = false
var is_focused: bool = false
var total: float = 0
var being_dug: bool = false


var is_fresh: bool = false
var value: int = 0

var total_dig_time: float = randf_range(1.0, 2.0) 




func _body_entered(body) -> void:
	if body.name == "player":
		if !perm:
			$Label.show()
			is_focused = true

func _body_exited(body) -> void:
	if body.name == "player":
		if !perm:
			$Label.hide()
			is_focused = false
			$ProgressBar.hide()


func _ready() -> void:
	value = randi_range(2000, 4000)
	if is_fresh:
		value = value * 3
		total_dig_time *= 1.3
	if randi_range(0,100) < 90: is_fresh = true
	if $Label != null: $Label.hide()
	$ProgressBar.hide()
	$Area2D.body_entered.connect(_body_entered)
	$Area2D.body_exited.connect(_body_exited)
	$AnimatedSprite2D.hide()
	
func _process(delta: float) -> void:
	if is_focused and Input.is_action_pressed("ui_accept"):
		$ProgressBar.show()
		total += (100/total_dig_time) * delta
		if !being_dug: 
			$AnimatedSprite2D.show()
			$AnimatedSprite2D.play()
			$AnimatedSprite2D.speed_scale =  9 / total_dig_time
			being_dug = true
		$ProgressBar.value = total
		if total >= 100.0:
			$AnimatedSprite2D.stop()
			$AnimatedSprite2D.frame = 8
			perm = true
			Global.money += value
			is_focused = false
			$Label.hide()
			$ProgressBar.hide()
			stop_digging.emit()
	else:
		total = 0
		if !perm:
			$AnimatedSprite2D.hide()
			$AnimatedSprite2D.stop()
		being_dug = false
