extends Area2D
signal found_player


@export var speed: int = 300
@export var player: Node2D

var to_position: Vector2 = Vector2( 600, 700)


func next_pos():
	if randi_range(1,10) >= 8:
		var offset = Vector2.ZERO
		offset.x = randi_range(0,50) - 25
		offset.y = randi_range(0,50) - 25
		to_position = player.position + offset
	else:
		to_position = Vector2( randf_range(0, get_viewport_rect().size.x), randf_range(0, get_viewport_rect().size.y))

func _ready() -> void:
	$Timer.timeout.connect(timeout)
	$AnimatedSprite2D.play()
	$Timer.start()

func _process(delta: float) -> void:
	var direction = (to_position - position).normalized()
	position += direction * speed * delta
	$AnimatedSprite2D.flip_h = direction.x >= 0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$AudioStreamPlayer2D.play()
		found_player.emit()

func timeout() -> void:
	next_pos()
	$Timer.start()

		
