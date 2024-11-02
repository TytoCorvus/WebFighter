class_name Interactable
# Very simple class illustrating the current interactible locations of an entity

var position_offset: Vector2
var hitboxes: Array[FrameBox]
var hurtboxes: Array[FrameBox]

func _init(_hitboxes, _hurtboxes):
	hitboxes = _hitboxes
	hurtboxes = _hurtboxes
	position_offset = Vector2.ZERO

func intersects(other: Interactable) -> IntersectionType:
	var a_intersects: bool = false
	var b_intersects: bool = false
	var clash: bool = false
	
	for a_hit in hitboxes:
		for b_hurt in other.hurtboxes:
			var a_b_hit = is_overlap(a_hit, position_offset, b_hurt, other.position_offset)
			if a_b_hit:
				a_intersects = true
				
	for a_hurt in hurtboxes:
		for b_hit in other.hitboxes:
			var b_a_hit = is_overlap(a_hurt, position_offset, b_hit, other.position_offset)
			if b_a_hit:
				b_intersects = true
				
	for a_hit in hitboxes:
		for b_hit in other.hitboxes:
			var a_b_clash = is_overlap(a_hit, position_offset, b_hit, other.position_offset)
			if a_b_clash:
				clash = true
	
	return IntersectionType.new(a_intersects, b_intersects, clash)
	
func is_overlap(a: FrameBox, a_offset: Vector2, b: FrameBox, b_offset: Vector2) -> bool:
	var a_min: Vector2 = a.offset + a_offset
	var b_min: Vector2 = b.offset + b_offset
	
	var a_max = a.area
	var b_max = b.area
	
	var x_overlap: bool = false
	var y_overlap: bool = false
	
	if (a_min.x >= b_min.x && a_min.x <= b_max.x) || (b_min.x >= a_min.x && b_min.x <= a_max.x):
		x_overlap = true
		
	if (a_min.y >= b_min.y && a_min.y <= b_max.y) || (b_min.y >= a_min.y && b_min.y <= a_max.y):
		y_overlap = true
	
	return x_overlap && y_overlap
	
