extends Node3D

@export var keyR=3
@export var keyB=2
@export var keyG=5
@onready var puzzle_1: ColorRect = $Puzzle_1


func _on_player_hit_end() -> void:
	$Puzzle_1.visible=true
	$Player.stuck=true






func _on_puzzle_1_check(red: Variant, blue: Variant, green: Variant) -> void:
	if red==keyR and blue==keyB and green==keyG:
		print("you win")
	else:
		print("try again")


func _on_puzzle_1_close() -> void:
	$Player.stuck=false
