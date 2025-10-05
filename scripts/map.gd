extends Node2D

func _ready():
	$ground.navigation_layer_mask = (1 << 0) | (1 << 1)  # Mask = 0b11
	$props.navigation_layer_mask = (1 << 1)
