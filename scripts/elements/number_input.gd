extends Label
func _process(delta: float) -> void:
	var parent = get_parent()
	if parent.has_method("set_output"):
		parent.set_output(0 ,int($NumberInput.text))
