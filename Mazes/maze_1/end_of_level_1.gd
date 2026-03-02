extends ColorRect
@onready var label: Label = $Label
@onready var retry: Button = $HBoxContainer/Retry
@onready var menu: Button = $HBoxContainer/Menu




func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://Mazes/maze_2/maze_2.tscn")




func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Other/main_menu.tscn")
