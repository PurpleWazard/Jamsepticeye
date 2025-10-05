extends CharacterBody2D 

@export var player: Node2D 
@export var ghost: Node2D 
var Goal: Vector2 = Vector2.ZERO
var get_ghost: bool = false
var get_player: bool = false

func _body_entered(body) -> void:
	if body.name == "player":
		get_tree().change_scene_to_file("res://scenes/death.tscn")

func new_rand_pos() -> Vector2:
	return Vector2( randf_range(45, 1169), randf_range(45, 636))

func _ready() -> void:
	Goal = new_rand_pos()
	$AnimatedSprite2D.play()
	$Area2D.body_entered.connect(_body_entered)
	$Timer.start()

func _process(delta: float) -> void:
	if get_ghost and position.distance_to($NavigationAgent2D.target_position) < 20:
		Goal = player.global_position
		get_ghost = false
		get_player = true
		print("got ghost")

	if get_player and position.distance_to($NavigationAgent2D.target_position) < 10:
		get_player = false
		Goal = new_rand_pos()
		print("done")

	if not get_ghost and not get_player and position.distance_to($NavigationAgent2D.target_position) < 20:
		Goal = new_rand_pos()

	$NavigationAgent2D.target_position = Goal
	velocity = to_local($NavigationAgent2D.get_next_path_position()).normalized() * 200
	$AnimatedSprite2D.flip_h = velocity.x > 0

	move_and_slide()
	
func _get_ghost() -> void:
	Goal = ghost.global_position
	get_ghost = true


func _on_timer_timeout() -> void:
	$Timer.start()
