extends KinematicBody2D

const MAX_SPEED = 10
const ACCELERATION = 2
var direction = Vector2()
var motion = Vector2()

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		motion.y = min(motion.y - ACCELERATION, -MAX_SPEED)
		direction = Vector2(0,-1)
	elif Input.is_action_pressed("ui_down"):
		motion.y = max(motion.y + ACCELERATION, MAX_SPEED)
		direction = Vector2(0,1)
	else:
		if motion.y > 10:
			motion.y -= 10
		elif motion.y < -10:
			motion.y += 10
		else:
			motion.y = 0
	
	if Input.is_action_pressed("ui_left"):
		motion.x = min(motion.x - ACCELERATION, -MAX_SPEED)
		direction = Vector2(-1,0)
	elif Input.is_action_pressed("ui_right"):
		motion.x = max(motion.x + ACCELERATION, MAX_SPEED)
		direction = Vector2(1,0)
	else:
		if motion.x > 10:
			motion.x -= 10
		elif motion.x < -10:
			motion.x += 10
		else:
			motion.x = 0
	
	motion = move_and_slide(motion)
	pass
