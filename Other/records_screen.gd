extends Control
@onready var best_time_1: Label = $best_time_1
@onready var best_time_2: Label = $best_time_2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.maze_1_time>0:
		best_time_1.text="Maze 1 best time: "+ str(Globals.maze_1_time)
	else:
		best_time_1.text="Maze 1 best time: No recorded time"
	if Globals.maze_2_time>0:
		best_time_2.text="Maze 2 best time: "+ str(Globals.maze_2_time)
	else:
		best_time_2.text="Maze 2 best time: No recorded time"


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Other/main_menu.tscn")
