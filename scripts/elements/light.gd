extends Label

func _ready() -> void:
	$Panel/PointLight2D.hide()

func _process(delta: float) -> void:
	var parent = get_parent()
	if parent.has_method("set_output") && parent.has_method("get_input"):
		if parent.get_input(0) != null:
			if parent.get_input(0) >= 1:
				$Panel/PointLight2D.show()
			else:
				$Panel/PointLight2D.hide()
