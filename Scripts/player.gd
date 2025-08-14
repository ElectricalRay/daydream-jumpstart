class_name Player extends CharacterBody2D


const SPEED = 700.0
const JUMP_VELOCITY = -800.0

@onready var animator = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		
		if velocity.x > 0:
			animator.flip_h = false
			animator.play("running")
			
		if velocity.x < 0:
			animator.flip_h = true
			animator.play("running")
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animator.play("idle")

	move_and_slide()
