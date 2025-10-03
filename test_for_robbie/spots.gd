extends Node2D
@export var nodes: Array[NodePath]
var guard
func _process(delta: float) -> void:
	pass


func _on_guard_hello_points() -> void:
	guard = get_node("guard")
	guard.grab_points(nodes)
	pass
