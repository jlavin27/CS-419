extends KinematicBody2D

const MAX_SPEED = 40
var direction = Vector2()
var motion = Vector2()
var health

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		motion.y = -MAX_SPEED
		direction = Vector2(0,-1)
		$Sprite.play("Up")
	elif Input.is_action_pressed("ui_down"):
		motion.y = MAX_SPEED
		direction = Vector2(0,1)
		$Sprite.play("Down")
	else:
		motion.y = 0
	
	if Input.is_action_pressed("ui_left"):
		motion.x = -MAX_SPEED
		direction = Vector2(-1,0)
		$Sprite.play("Left")
	elif Input.is_action_pressed("ui_right"):
		motion.x = MAX_SPEED
		direction = Vector2(1,0)
		$Sprite.play("Right")
	else:
		motion.x = 0
	
	motion = move_and_slide(motion)
	pass
