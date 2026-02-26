extends Node3D

var keyR:int
var keyB:int
var keyG:int
var time_left=150
var current_time=0
@onready var puzzle_1: ColorRect = $Puzzle_1

func _ready() -> void:
	keyR=randi_range(1,9)
	keyB=randi_range(1,9)
	keyG=randi_range(1,9)
	$HintR.text=str(keyR)
	$HintB.text=str(keyB)
	$HintG.text=str(keyG)
	$HintY.text=str(randi_range(1,9))
	$Timer.start()

func _process(delta: float) -> void:
	if not $end_of_level_1.visible:
		if Globals.mode=="survival":
			$Timer_label.text="Time left: "+str(time_left)
		elif Globals.mode=="speed":
			$Timer_label.text="Time: "+str(current_time)


func _on_player_hit_end() -> void:
	$Puzzle_1.visible=true
	$Player.stuck=true



func _on_puzzle_1_check(red: Variant, blue: Variant, green: Variant) -> void:
	if red==keyR and blue==keyB and green==keyG:
		$Puzzle_1.visible=false
		$"Simple Padlock".visible=false
		$end_of_level_1.visible=true
	else:
		$Puzzle_1.wrong.visible=true


func _on_puzzle_1_close() -> void:
	$Player.stuck=false
	$Puzzle_1.wrong.visible=false


func _on_timer_timeout() -> void:
	time_left-=1
	current_time+=1


func _on_lose_timeout() -> void:
	if Globals.mode=="survival":
		$Player.stuck=true
		$end_of_level_1.visible=true
		$end_of_level_1.label.text="You were forever lost in the maze"
		$Timer_label.text="Time left: 0"
