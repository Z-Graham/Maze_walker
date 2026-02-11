extends Camera3D
@export var speed=5

var stuck=false
signal hit_end
var direction='forward'
var turning=false
var looking_up=false
var looking_down=false
var moving_forward=false
var moving_back=false
var del:float
func _process(delta: float) -> void:
	del=delta
	if not stuck:
		if Input.is_action_pressed('move_forward'):
			if not turning:
				moving_back=false
				moving_forward=true
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
				moving_forward=false
				moving_back=true
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
				looking_up=false
				looking_down=false
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
				looking_up=false
				looking_down=false
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
		if Input.is_action_just_pressed("look_up"):
			if looking_up==false:
				if looking_down==false:
					var turn=create_tween()
					turn.tween_property($".",'global_rotation_degrees',Vector3(global_rotation.x+30,global_rotation_degrees.y,global_rotation_degrees.z),0.5)
					looking_up=true
				else:
					var turn=create_tween()
					turn.tween_property($".",'global_rotation_degrees',Vector3(global_rotation.x,global_rotation_degrees.y,global_rotation_degrees.z),0.5)
				looking_down=false
		if Input.is_action_just_pressed("look_down"):
			if looking_down==false:
				if looking_up==false:
					var turn=create_tween()
					turn.tween_property($".",'global_rotation_degrees',Vector3(global_rotation.x-30,global_rotation_degrees.y,global_rotation_degrees.z),0.5)
					looking_down=true
				else:
					var turn=create_tween()
					turn.tween_property($".",'global_rotation_degrees',Vector3(global_rotation.x,global_rotation_degrees.y,global_rotation_degrees.z),0.5)
				looking_up=false





func _on_area_3d_body_entered(body: Node3D) -> void:
	if moving_forward:
		if direction=='left':
			global_position.x+=0.5
		elif direction=='right':
			global_position.x-=0.5
		elif direction=='forward':
			global_position.z+=0.5
		elif direction=='back':
			global_position.z-=0.5
	elif moving_back:
		if direction=='left':
			global_position.x-=0.5
		elif direction=='right':
			global_position.x+=0.5
		elif direction=='forward':
			global_position.z-=0.5
		elif direction=='back':
			global_position.z+=0.5
	if 'door' in body.get_groups():
		hit_end.emit()
