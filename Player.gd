extends KinematicBody2D

const MAX_SPEED = .75
const ACCELERATION = .75
const DECELERATION = 4
var direction = Vector2()
var motion = Vector2()

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		motion.y = min(motion.y - ACCELERATION, -MAX_SPEED)
		direction = Vector2(0,-1)
		$Sprite.play("Up")
	elif Input.is_action_pressed("ui_down"):
		motion.y = max(motion.y + ACCELERATION, MAX_SPEED)
		direction = Vector2(0,1)
		$Sprite.play("Down")
	else:
		if motion.y >= MAX_SPEED * 33:
			motion.y -= DECELERATION
		elif motion.y <= -MAX_SPEED * .33:
			motion.y += DECELERATION
		else:
			motion.y = 0
	
	if Input.is_action_pressed("ui_left"):
		motion.x = min(motion.x - ACCELERATION, -MAX_SPEED)
		direction = Vector2(-1,0)
		$Sprite.play("Left")
	elif Input.is_action_pressed("ui_right"):
		motion.x = max(motion.x + ACCELERATION, MAX_SPEED)
		direction = Vector2(1,0)
		$Sprite.play("Right")
	else:
		if motion.x >= MAX_SPEED * 33:
			motion.x -= DECELERATION
		elif motion.x <= -MAX_SPEED * 33:
			motion.x += DECELERATION
		else:
			motion.x = 0
	
	motion = move_and_slide(motion)
	pass
