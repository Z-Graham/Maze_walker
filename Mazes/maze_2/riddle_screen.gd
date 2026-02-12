extends ColorRect
@onready var riddle: Label = $Riddle
@onready var a: Button = $A
@onready var b: Button = $B
@onready var c: Button = $C
@onready var d: Button = $D
@onready var chances: Label = $chances



var c_riddle=4

func _process(delta: float) -> void:
	if c_riddle==1:
		riddle.text="What came first? The phoenix or the flame?"
		a.text="The phoenix"
		b.text="The flame"
		c.text="A circle has no beginning"
		d.text="Time"
	elif c_riddle==2:
		riddle.text="The power of authority, for better or worse. 
		Held by the strong, and rarely the weak. 
		The key to a myriad of shortcuts."
		a.text="Control"
		b.text="Bravery"
		c.text="Leadership"
		d.text="Money"
	elif c_riddle==3:
		riddle.text="4(x+7)+18=54
		Find x"
		a.text="8"
		b.text="4"
		c.text="Between the 4 and the 7"
		d.text="2"
	elif c_riddle==4:
		riddle.text="The home of millions with color all around. 
		Companion of the moon and 
		home to the father of the cyclops."
		a.text="The ocean"
		b.text="The forest"
		c.text="The city"
		d.text="The sky"





func _on_a_pressed() -> void:
	if c_riddle==2 or c_riddle==4:
		visible=false
	else:
		a.visible=false
		var fade=create_tween()
		fade.tween_property(chances,"modulate",Color("ffffff"),0.5)
		await fade.finished
		var fade2=create_tween()
		fade2.tween_property(chances,"modulate",Color("ffffff00"),0.5)


func _on_b_pressed() -> void:
	b.visible=false
	var fade=create_tween()
	fade.tween_property(chances,"modulate",Color("ffffff"),0.5)
	await fade.finished
	var fade2=create_tween()
	fade2.tween_property(chances,"modulate",Color("ffffff00"),0.5)


func _on_c_pressed() -> void:
	if c_riddle==1 or c_riddle==3:
		visible=false
	else:
		c.visible=false
		var fade=create_tween()
		fade.tween_property(chances,"modulate",Color("ffffff"),0.5)
		await fade.finished
		var fade2=create_tween()
		fade2.tween_property(chances,"modulate",Color("ffffff00"),0.5)


func _on_d_pressed() -> void:
	if c_riddle==3:
		visible=false
	else:
		d.visible=false
		var fade=create_tween()
		fade.tween_property(chances,"modulate",Color("ffffff"),0.5)
		await fade.finished
		var fade2=create_tween()
		fade2.tween_property(chances,"modulate",Color("ffffff00"),0.5)
