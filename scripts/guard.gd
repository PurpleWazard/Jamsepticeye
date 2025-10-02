extends StaticBody2D

@export var all_nodes: Array[NodePath]

# Called when the node enters the scene tree for the first time.
var current_node: Node2D = null
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if current_node == null:
		get_node_to_move()
	else:
		if position == current_node.position:


	
	
func get_rand_node() -> void:
	var nodepath: NodePath= all_nodes.pick_random()
	current_node = get_node(nodepath)

func get_node_to_move() -> void:
	current_node = current_node.Moveable_nodes.pick_random()

