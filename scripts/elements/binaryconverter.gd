extends Control

@export var invert: bool = false

func to_binary(intValue: int) -> int:
	var bin: int = 0
	var place: int = 1
	while intValue > 0:
		var bit = intValue & 1
		bin += bit * place
		place *= 10
		intValue >>= 1
	return bin

func from_binary(binValue: int) -> int:
	var dec: int = 0
	var place: int = 1
	while binValue > 0:
		var digit = binValue % 10
		dec += digit * place
		place *= 2
		binValue /= 10
	return dec
	
func _process(delta: float) -> void:
	var parent = get_parent()
	if parent.has_method("set_output") && parent.has_method("get_input"):
		var num = parent.get_input(0)
		if num != null:
			if invert:
				parent.set_output(0, from_binary(num))
			else:
				parent.set_output(0, to_binary(num))
