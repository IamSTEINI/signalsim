extends LineEdit

func _on_text_changed(new_text: String) -> void:
	var int_regex = RegEx.new()
	int_regex.compile("^[-+]?[0-9]+$")
	if !int_regex.search(new_text):
		text = ""
