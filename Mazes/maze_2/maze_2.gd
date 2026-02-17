extends Node3D

@onready var sphynx_1: CSGBox3D = $Sphynx_1
@onready var sphynx_2: CSGBox3D = $Sphynx_2
@onready var sphynx_3: CSGBox3D = $Sphynx_3
@onready var sphynx_4: CSGBox3D = $Sphynx_4
@onready var riddle_screen: ColorRect = $riddle_screen
@onready var player: Camera3D = $Player

var lock_1=false
var lock_2=false
var lock_3=false
var lock_4=false


func _on_player_show_riddle(s:CSGBox3D) -> void:
	riddle_screen.c_riddle=s.riddle
	riddle_screen.visible=true
	player.stuck=true


func _on_riddle_screen_close() -> void:
	player.stuck=false
	for s in get_tree().get_nodes_in_group('sphynx'):
		if s.riddle==riddle_screen.c_riddle:
			s.active=false
	if lock_1==false:
		lock_1==true
	elif lock_1==true:
		lock_2=true
	elif lock_2==true:
		lock_3=true
	elif lock_3==true:
		lock_4=true
