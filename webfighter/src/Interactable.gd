class_name Interactable
# Very simple class illustrating the current interactible locations of an entity

var position_offset: Vector2
var hitboxes: Array[FrameBox]
var hurtboxes: Array[FrameBox]

func _init(_hitboxes, _hurtboxes):
	hitboxes = _hitboxes
	hurtboxes = _hurtboxes
	position_offset = Vector2.ZERO
