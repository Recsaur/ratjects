extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.Apply_Knockback(position,1000)
	$Sprite2D.play("sproing")
	await $Sprite2D.animation_finished
	$Sprite2D.play("default")
	pass # Replace with function body.
