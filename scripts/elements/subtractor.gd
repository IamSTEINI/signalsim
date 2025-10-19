extends Control

func _process(delta: float) -> void:
	var parent = get_parent()
	if parent.has_method("set_output") && parent.has_method("get_input"):
		var num1 = parent.get_input(0)
		var num2 = parent.get_input(1)
		if num1 != null and num2 != null:
			parent.set_output(0,num1-num2)
		else:
			parent.set_output(0,0)
