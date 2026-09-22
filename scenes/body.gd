extends Node2D
@onready var TailPoint = $"../Marker2D"
@export var SegmentDist = 4
@export var FollowSpeed = 50

var Segments = []
func _ready() -> void:
	top_level = true
	for child in get_children():
		Segments.append(child)

func _process(delta: float) -> void:
	var lead_position = TailPoint.global_position
	
	for tail in range(Segments.size()):
		var segment = Segments[tail]
		var leading = lead_position - segment.global_position
		var target_pos = lead_position - leading.normalized() * SegmentDist
		segment.global_position = segment.global_position.lerp(target_pos, FollowSpeed * delta)
		segment.global_rotation = lerp_angle(segment.global_rotation, leading.angle(), FollowSpeed * delta)
		lead_position = segment.global_position
