extends Node3D

@onready var sphynx_1: CSGBox3D = $Sphynx_1
@onready var sphynx_2: CSGBox3D = $Sphynx_2
@onready var sphynx_3: CSGBox3D = $Sphynx_3
@onready var sphynx_4: CSGBox3D = $Sphynx_4
@onready var riddle_screen: ColorRect = $riddle_screen
@onready var player: Camera3D = $Player
@onready var lock_text: Label = $lock_text

var lock_1=false
var lock_2=false
var lock_3=false
var lock_4=false

func _process(delta: float) -> void:
	if riddle_screen.chances_left<=0:
		get_tree().reload_current_scene()


func _on_player_show_riddle(s:CSGBox3D) -> void:
	riddle_screen.c_riddle=s.riddle
	riddle_screen.visible=true
	player.stuck=true

func lock_text_fade():
	var fade=create_tween()
	fade.tween_property(lock_text,"modulate",Color("ffffff"),0.5)
	await fade.finished
	var fade2=create_tween()
	fade2.tween_property(lock_text,"modulate",Color("ffffff00"),0.5)
	await fade2.finished
	var fade3=create_tween()
	fade3.tween_property(lock_text,"modulate",Color("ffffff"),0.5)
	await fade3.finished
	var fade4=create_tween()
	fade4.tween_property(lock_text,"modulate",Color("ffffff00"),0.5)

func _on_riddle_screen_close() -> void:
	player.stuck=false
	riddle_screen.a.visible=true
	riddle_screen.b.visible=true
	riddle_screen.c.visible=true
	riddle_screen.d.visible=true
	for s in get_tree().get_nodes_in_group('sphynx'):
		if s.riddle==riddle_screen.c_riddle:
			s.active=false
	if lock_1==false:
		lock_1==true
		$lock_1.visible=false
		lock_text_fade()
	elif lock_1==true:
		lock_2=true
		$lock_2.visible=false
		lock_text_fade()
	elif lock_2==true:
		lock_3=true
		$lock_3.visible=false
		lock_text_fade()
	elif lock_3==true:
		lock_4=true
		$lock_4.visible=false
		lock_text_fade()
