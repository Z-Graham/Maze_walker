extends ColorRect



func _on_next_pressed() -> void:
	pass


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
