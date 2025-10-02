extends Area2D


@export var speed: int = 300

var to_position: Vector2 = Vector2( 600, 700)

func _process(delta: float) -> void:
	position += (to_position - position).normalized() * speed * delta

func new_pos() -> void:
	var viewport := get_viewport_rect()
	to_position = Vector2( randf_range(0, viewport.size.x), randf_range(0, viewport.size.y))

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$AudioStreamPlayer2D.play()
		

