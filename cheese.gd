extends Area2D

const fx = preload("res://scenes/fx_control.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	var collectparticle = fx.instantiate()
	GameControl.cheese += 1
	get_parent().add_child(collectparticle)
	GameControl.emit_signal("Action",10)
	collectparticle.position = position
	queue_free()
	pass # Replace with function body.
