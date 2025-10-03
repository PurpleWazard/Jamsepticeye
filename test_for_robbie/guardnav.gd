extends CharacterBody2D
var Points: Array
var speed = 100
@onready var Nav_agent: NavigationAgent2D = $NavigationAgent2D
signal hello_points

func _ready() -> void:
	emit_signal("hello_points")




func _physics_process(delta: float) -> void:
	navigate(delta)
	pass

func grab_points(points):
	Points = points
	print(points)
	var new_target = get_parent().get_node(Points.pick_random()).global_position
	print(new_target)
	Nav_agent.target_position = new_target

func manual_nav() -> void:
	pass

func navigate(delta: float) -> void:
	if Nav_agent.is_navigation_finished():
		var new_target = get_parent().get_node(Points.pick_random()).global_position
		print(new_target)
		Nav_agent.target_position = new_target
	var next_path_pos: Vector2 = Nav_agent.get_next_path_position()
	var new_vel: Vector2 = (
		global_position.direction_to(next_path_pos) * speed
	)
	position += new_vel * delta
