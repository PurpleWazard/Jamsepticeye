extends Control

func _ready() -> void:
	$"PixilFrame0(19)".frame = randi_range(0,3)
	
func tell_state(person):
	person.state_got($"PixilFrame0(19)".frame)
