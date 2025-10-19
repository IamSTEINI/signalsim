extends Label

func _process(delta: float) -> void:
	var parent = get_parent()
	if parent.has_method("get_input"):
		var val = parent.get_input(0)
		if val != null:
			$RichTextLabel.text = str(val)
		else:
			$RichTextLabel.text = ""
