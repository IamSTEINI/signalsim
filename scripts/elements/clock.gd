extends Label

var elapsed := 0.0
var interval := 1.0
var on: bool = false

func _process(delta: float) -> void:
	var parent = get_parent()
	if not parent.has_method("set_output"):
		return
	interval = float($NumberInput.text) / 1000.0
	elapsed += delta
	if elapsed >= interval:
		elapsed = 0.0
		on = !on
		parent.set_output(0, 1 if on else 0)
