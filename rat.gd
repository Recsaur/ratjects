extends CharacterBody2D

var TransDone = false
const SPEED = 500.0
const MOMENTUM = 125
#const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if TransDone:
		var direction := Input.get_vector("left","right","up","down")
		if direction:
			velocity = velocity.move_toward(direction * SPEED, SPEED * delta)
			#rotation = lerp_angle(rotation, velocity.angle(), delta * 10.0)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, 1500 * delta)
		if velocity.length() > 1.0:
			rotation = lerp_angle(rotation, velocity.angle(), delta * 10.0)
		move_and_slide()
