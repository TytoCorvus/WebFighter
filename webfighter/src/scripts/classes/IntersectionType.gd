class_name IntersectionType 

var _a_intersects_b: bool
var _b_intersects_a: bool
var _clash: bool

func _init(a_intersects: bool, b_intersects: bool, clash: bool) -> void:
	_a_intersects_b = a_intersects
	_b_intersects_a = b_intersects
	_clash = clash
	
func intersection() -> bool:
	return _a_intersects_b || _b_intersects_a

func no_intersection() -> bool:
	return !intersection()

func clash() -> bool:
	return _clash

func _to_string() -> String:
	return "a->b: %b - b->a: %b - clash: %b" % [_a_intersects_b, _b_intersects_a, _clash]
