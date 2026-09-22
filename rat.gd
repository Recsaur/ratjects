extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0
@onready var spriteanims = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			spriteanims.flip_h = true
			spriteanims.play("walk")
		elif direction > 0:
			spriteanims.flip_h = false
			spriteanims.play("walk")
	else:
		spriteanims.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if not is_on_floor():
		spriteanims.play("fall")
		velocity += get_gravity() * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		spriteanims.play("jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()
