extends Control
@onready var graph_edit = $GraphEdit
@onready var node_menu = $CanvasLayer/NodeMenu
@export var add_button: PackedScene = null
# NODE SCENES
@export var nodes: Dictionary[String, PackedScene] = {}
var selected_nodes = []

func _ready() -> void:
	node_menu.hide()
	$CanvasLayer/NodeMenu/INPUT/LineEdit.text_changed.connect(_on_node_name_text_changed)
	
	for node_name in nodes.keys():
		var new_node = add_button.instantiate()
		new_node.text = node_name
		var scene = nodes[node_name]
		new_node.pressed.connect(_on_add_node_button_pressed.bind(node_name, scene))
		$CanvasLayer/Menu.add_child(new_node)

func _on_add_node_button_pressed(node_name: String, scene: PackedScene) -> void:
	var new_node = scene.instantiate()
	new_node.title_text = node_name
	new_node.node_selected.connect(_on_node_node_selected)
	new_node.node_deselected.connect(_on_node_node_deselected)
	graph_edit.add_child(new_node)
	
func _on_node_node_selected() -> void:
	selected_nodes = []
	for node in graph_edit.get_children():
		if node is GraphNode and node.selected:
			selected_nodes.append(node)
			
	if selected_nodes.size() > 0:
		$CanvasLayer/NodeMenu/DeleteSelected.text = "DELETE ("+str(selected_nodes.size())+")"
		node_menu.show()
		_update_node_name_field()
	
func _on_node_node_deselected() -> void:
	node_menu.hide()
	
func _on_delete_selected_pressed() -> void:
	for node in selected_nodes:
		node.queue_free()
	selected_nodes = []
	node_menu.hide()

func _update_node_name_field() -> void:
	if selected_nodes.size() == 0:
		$CanvasLayer/NodeMenu/INPUT/LineEdit.text = ""
		return
		
	var fname = selected_nodes[0].title if selected_nodes[0].title else selected_nodes[0].name
	var same = true
	
	for node in selected_nodes:
		var node_name = node.title if node.title else node.name
		if node_name != fname:
			same = false
			break
			
	$CanvasLayer/NodeMenu/INPUT/LineEdit.text = fname if same else ""
	
func _on_node_name_text_changed(new_text: String) -> void:
	for node in selected_nodes:
		node.title_text = new_text
