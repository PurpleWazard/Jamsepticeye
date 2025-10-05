extends CharacterBody2D


var SPEED = 100.0
var RUN_SPEED = 800.0
var alr_digging: bool = false

func _process(delta: float) -> void:
	var local_speed = SPEED
	var direction: Vector2
	if Input.is_action_pressed("ui_accept"):
		if !alr_digging:
			$AnimatedSprite2D.animation = "dig"
			$AnimatedSprite2D.play()
			$AnimatedSprite2D.speed_scale = 2
	else:
		alr_digging = false
		$AnimatedSprite2D.animation = "walk"
		if Input.is_action_pressed("ui_run"):
			local_speed = RUN_SPEED

		direction.x = Input.get_axis("ui_left", "ui_right")
		direction.y = Input.get_axis("ui_up", "ui_down")
		if direction.length() > 0:
			direction = direction.normalized()
			$AnimatedSprite2D.play()
			$AnimatedSprite2D.flip_h = direction.x < 0
		else:
			$AnimatedSprite2D.stop()
	
		$AnimatedSprite2D.speed_scale = local_speed * 0.005
		velocity = direction * local_speed
		move_and_slide()




func _on_animated_sprite_2d_animation_looped() -> void:
	if $AnimatedSprite2D.animation == "dig":
		$AnimatedSprite2D.animation = "dig_loop"
		alr_digging = true



