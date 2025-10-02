extends CharacterBody2D
signal connect_to_marker
var Delta
var markers: Node2D
var Letters = ["A","B","C","D"]
var Numbers = ["1","2","3","4","5"]
var Actions = ["up","down","left","right"]
var previous_location = "C2"
var Speed = 300.0
var Y = 3
var X = 2
var Vel
var Ghost_heard = true
func _ready() -> void:
	emit_signal("connect_to_marker")
	print(markers)

func looking_around():
	
	pass
func _process(delta: float) -> void:
	Delta = delta
	if Vel:
		velocity = Vel / Speed
	move_and_slide()
func move():
	if not Ghost_heard:
		var action = Actions.pick_random()
		print(action)
		var point_to_move
		if action == "up":
			Y = clamp(Y - 1, 0, 3)
		if action == "down":
			Y = clamp(Y + 1, 0, 3)
		if action == "left":
			X = clamp(X - 1, 0, 4)
		if action == "right":
			X = clamp(X + 1, 0, 4)
		point_to_move = str(Letters[Y] + Numbers[X])
		print(point_to_move)
		Vel = find_velocity_needed(point_to_move)
	
	pass


func find_velocity_needed(marker):
	var target_marker: Node2D 
	if not Ghost_heard:
		target_marker = markers.find_child(marker)
	else:
		target_marker = marker
	var target_position = target_marker.global_position
	var my_x = global_position.x
	var my_y = global_position.y
	var snack_X = target_position.x
	var snack_Y = target_position.y
	var distance_X = snack_X - my_x
	var distance_Y = snack_Y - my_y
	return Vector2(distance_X / Delta, distance_Y / Delta)


func _on_ghost_found_player(ghost) -> void:
	Ghost_heard = true
	while Ghost_heard:
		find_velocity_needed(ghost)
		pass
