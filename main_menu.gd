extends Control





func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Mazes/maze_1/maze_1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Mazes/maze_2/maze_2.tscn")


func _on_check_button_item_selected(index: int) -> void:
	if index==0:
		Globals.mode="survival"
	elif index==1:
		Globals.mode="speed"
