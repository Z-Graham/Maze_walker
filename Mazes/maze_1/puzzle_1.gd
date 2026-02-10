extends ColorRect
@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var label_3: Label = $Label3
@onready var wrong: Label = $wrong

signal check(red,blue,green)
signal close()

var red_val=0
var blue_val=0
var green_val=0

func _process(delta: float) -> void:
	label.text=str(red_val)
	label_2.text=str(blue_val)
	label_3.text=str(green_val)
	if red_val>9:
		red_val=0
	if blue_val>9:
		blue_val=0
	if green_val>9:
		green_val=0

func _on_red_pressed() -> void:
	red_val+=1


func _on_blue_pressed() -> void:
	blue_val+=1


func _on_green_pressed() -> void:
	green_val+=1



func check_puzzle():
	check.emit(red_val,blue_val,green_val)


func _on_unlock_pressed() -> void:
	check_puzzle()


func _on_close_pressed() -> void:
	red_val=0
	blue_val=0
	green_val=0
	close.emit()
	visible=false
