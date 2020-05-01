extends KinematicBody2D

const GRAVITY = 10
const WALK_SPEED = 100
const JUMP = -200
const FLOOR = Vector2(0, -1)

export var extraJumps = 1

var velocity = Vector2()
var on_ground = false


func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left"):
		get_node("Sprite").set_flip_h(true)
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		get_node("Sprite").set_flip_h(false)
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP
			on_ground = false
	
	if is_on_floor():
		on_ground = true
		 
	else:
		on_ground = false
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
