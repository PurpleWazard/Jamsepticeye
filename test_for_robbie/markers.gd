extends Node2D


func _on_guard_connect_to_marker() -> void:
	$"../guard".markers = self
