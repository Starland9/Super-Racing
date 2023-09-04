extends CharacterBody2D

var max_speed := 5000
var current_speed := 0
var acceleration := 100
var rotation_speed := 3
var accel_direction_y := 0


func _physics_process(delta):
	
	var accel_input := Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var turn_input := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	
	if accel_input:
		current_speed += acceleration
		current_speed = min(current_speed, max_speed)
		velocity = Vector2(0, current_speed * accel_input).rotated(rotation)
		if accel_direction_y != accel_input:
				accel_direction_y = float(accel_input)
		
	else:
		current_speed = lerp(current_speed, 0, 0.01)
		velocity = Vector2(0, current_speed* accel_direction_y).rotated(rotation)
		
	if int(current_speed) != 0:
		rotate(turn_input * delta * -accel_direction_y * rotation_speed) 
		

	move_and_collide(velocity * delta)
