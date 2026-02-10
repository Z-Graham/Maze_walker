extends Node3D

@export var keyR=randi_range(1,10)
@export var keyB=randi_range(1,10)
@export var keyG=randi_range(1,10)
@onready var puzzle_1: ColorRect = $Puzzle_1

func ready():
	$HintR.text=str(keyR)
	$HintB.text=str(keyB)
	$HintG.text=str(keyG)

func _on_player_hit_end() -> void:
	$Puzzle_1.visible=true
	$Player.stuck=true



func _on_puzzle_1_check(red: Variant, blue: Variant, green: Variant) -> void:
	if red==keyR and blue==keyB and green==keyG:
		$Puzzle_1.visible=false
		$end_of_level_1.visible=true
	else:
		$Puzzle_1.wrong.visible=true


func _on_puzzle_1_close() -> void:
	$Player.stuck=false
	$Puzzle_1.wrong.visible=false
