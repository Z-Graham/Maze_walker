extends Control





func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Mazes/maze_1/maze_1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Mazes/maze_2/maze_2.tscn")
