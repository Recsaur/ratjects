extends CharacterBody2D

var KB = Vector2.ZERO
var KB_Length = 25.0
const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@onready var spriteanims = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	position += KB * delta
	KB = KB.move_toward(Vector2.ZERO, KB_Length)
	$CanvasLayer/Label.text = str("Cheese: ",GameControl.cheese)
	
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
	move_and_slide()


func Apply_Knockback(KB_Source, KB_Strength):
	var KB_dir = Vector2(0,-1)#KB_Source.direction_to(global_position)
	KB = KB_dir * KB_Strength
