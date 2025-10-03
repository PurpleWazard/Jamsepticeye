extends StaticBody2D

@export var all_nodes: Array[NodePath]

var current_node = null

func _ready():
	get_rand_node()

func _process(delta: float) -> void:
	if position.distance_to(current_node.position) <= 2 :
		get_node_to_move()
	else:
		position += ( current_node.position - position ).normalized() * delta * 300


	
	
func get_rand_node() -> void:
	var nodepath: NodePath= all_nodes.pick_random()
	current_node = get_node(nodepath)

func get_node_to_move() -> void:
	current_node = get_node(current_node.Moveable_nodes.pick_random())
