extends Camera3D
@export var speed=5
var direction='forward'
var turning=false
func _process(delta: float) -> void:
	if Input.is_action_pressed('move_forward'):
		if not turning:
			if direction=='forward':
				global_position.z-=speed*delta
			elif direction=='left':
				global_position.x-=speed*delta
			elif direction=='right':
				global_position.x+=speed*delta
			elif direction=='back':
				global_position.z+=speed*delta
	if Input.is_action_pressed('move_backward'):
		if not turning:
			if direction=='forward':
				global_position.z+=speed*delta
			elif direction=='left':
				global_position.x+=speed*delta
			elif direction=='right':
				global_position.x-=speed*delta
			elif direction=='back':
				global_position.z-=speed*delta
	if Input.is_action_just_pressed("turn_left"):
		if not turning:
			turning=true
			var turn=create_tween()
			turn.tween_property($".",'global_rotation_degrees',Vector3(global_rotation.x,global_rotation_degrees.y+90,global_rotation_degrees.z),0.5)
			await turn.finished
			turning=false
			if direction=='forward':
				direction='left'
			elif direction=='left':
				direction='back'
			elif direction=='back':
				direction='right'
			elif direction=='right':
				direction='forward'
			
	if Input.is_action_just_pressed("turn_right"):
		if not turning:
			turning=true
			var turn=create_tween()
			turn.tween_property($".",'global_rotation_degrees',Vector3(global_rotation.x,global_rotation_degrees.y-90,global_rotation_degrees.z),0.5)
			await turn.finished
			turning=false
			if direction=='forward':
				direction='right'
			elif direction=='left':
				direction='forward'
			elif direction=='back':
				direction='left'
			elif direction=='right':
				direction='back'
