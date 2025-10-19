extends Control

func _process(delta: float) -> void:
	var parent = get_parent()
	if parent.has_method("set_output") && parent.has_method("get_input"):
		parent.set_output(0 ,parent.get_input(0))
