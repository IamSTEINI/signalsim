extends GraphEdit

var node_conns = {}

func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	connect_node(from_node, from_port, to_node, to_port)
	var key = "%s:%d" % [from_node, from_port]
	if key not in node_conns:
		node_conns[key] = []
	node_conns[key].append([to_node, to_port])

func _filter_connection(item, remove_node, remove_port):
	return item[0] != remove_node or item[1] != remove_port

func _on_disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	disconnect_node(from_node, from_port, to_node, to_port)
	var key = "%s:%d" % [from_node, from_port]
	if key in node_conns:
		var new_list = []
		for pair in node_conns[key]:
			if pair[0] != to_node or pair[1] != to_port:
				new_list.append(pair)
		if new_list.size() == 0:
			node_conns.erase(key)
		else:
			node_conns[key] = new_list

func find_child_by_name(parent: Node, name: String) -> Node:
	for child in parent.get_children():
		if child.name == name:
			return child
	return null

func _process(delta):
	for key in node_conns.keys():
		var parts = key.split(":")
		var from_node_name = parts[0]
		var from_port = int(parts[1])

		var from_node = find_child_by_name(self, from_node_name)
		if from_node == null:
			continue
		var output = from_node.get_output(from_port)
		if output == null:
			continue
		for pair in node_conns[key]:
			var to_node_name = pair[0]
			var to_port = pair[1]
			var to_node = find_child_by_name(self, to_node_name)
			if to_node == null:
				continue
			to_node.set_input(to_port, output)
