extends StaticBody2D


var SPEED = 300.0
var RUN_SPEED = 800.0

func _physics_process(delta: float) -> void:
	var local_speed = SPEED
	var direction: Vector2
	if Input.is_action_pressed("ui_run"):
		local_speed = RUN_SPEED

	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	if direction.length() > 0:
		direction = direction.normalized()
	
	position += direction * local_speed * delta

