extends Label

func _on_button_button_down() -> void:
	var parent = get_parent()
	if not parent.has_method("set_output"):
		return
	parent.set_output(0, 1)


func _on_button_button_up() -> void:
	var parent = get_parent()
	if not parent.has_method("set_output"):
		return
	parent.set_output(0, 0)
