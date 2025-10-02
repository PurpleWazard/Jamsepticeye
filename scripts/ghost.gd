extends Area2D
signal found_player


@export var speed: int = 300

var to_position: Vector2 = Vector2( 600, 700)

func _ready() -> void:
	$AnimatedSprite2D.play()

func _process(delta: float) -> void:
	var direction = (to_position - position).normalized()
	position += direction * speed * delta
	$AnimatedSprite2D.flip_h = direction.x > 0

func new_pos() -> void:
	var viewport := get_viewport_rect()
	to_position = Vector2( randf_range(0, viewport.size.x), randf_range(0, viewport.size.y))

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$AudioStreamPlayer2D.play()
		found_player.emit(self)
		
