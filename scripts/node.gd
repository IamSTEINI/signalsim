extends GraphNode

var inputs: Array = []
var outputs: Array = []
@export var in_size = 0
@export var out_size = 0
@export var output = 0
@export var input = 0
@export var title_text = "Node"

func _ready() -> void:
	inputs.resize(in_size)
	outputs.resize(out_size)

func _process(_delta: float) -> void:
	title = title_text
	output = get_output(0)
	input = get_input(0)

func set_input(port_index: int, value) -> void:
	if inputs.size() <= port_index:
		inputs.resize(port_index + 1)
	inputs[port_index] = value
	
func get_input(port_index: int) -> Variant:
	if inputs.size() <= port_index:
		return null
	return inputs[port_index]

func set_output(port_index: int, value) -> void:
	if outputs.size() <= port_index:
		outputs.resize(port_index + 1)
	outputs[port_index] = value

func get_output(port_index: int) -> Variant:
	if outputs.size() <= port_index:
		return 0
	if outputs[port_index] == null:
		return 0
	return outputs[port_index]
