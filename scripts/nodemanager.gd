extends GraphEdit


func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	connect_node(from_node, from_port, to_node, to_port)
	print("Verbunden mit:", from_node, "port", from_port, ">>>", to_node, to_port)


func _on_disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	disconnect_node(from_node, from_port, to_node, to_port)
	print("Nicht mehr verbunden mit:", from_node, "port", from_port, ">>>", to_node, to_port)
