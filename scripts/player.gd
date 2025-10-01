extends StaticBody2D


var SPEED = 300.0
var RUN_SPEED = 800.0

<<<<<<< HEAD
func _physics_process(_delta: float) -> void:
	# Add the gravity.
	# if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

# this is robbie use this for a topdown (:  easy, you can change it if you want but this is a easy implimentation


	var direction := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	
# ctrl + K from here to...
	if direction_y and direction:
		velocity.y = direction_y * SPEED / 1.5
		velocity.x = direction * SPEED / 1.5
# ...here to check why this is here

	elif direction_y or direction:
		velocity.y = direction_y * SPEED
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
=======
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

>>>>>>> 118829c84ff9960b0e13b990402c6315633a1b4b
