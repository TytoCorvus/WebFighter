class_name FrameBox

var startFrame: int
var endFrame: int

# The position from the origin
var offset: Vector2
# The descriptor of the size of the box
var area: Vector2

func _init(_startFrame: int, _endFrame: int, _offset: Vector2, _area: Vector2):
	startFrame = _startFrame
	endFrame = _endFrame
	offset = _offset
	area = _area
	pass

func is_active(frame: int) -> bool:
	return frame >= startFrame && frame <= endFrame

func _to_string() -> String:
	return "Start: %d, End: %d, Position: (%d,%d), Area: (%d,%d)" % [startFrame,endFrame,offset.x,offset.y,area.x,area.y]
