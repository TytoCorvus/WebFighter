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

static func from(other: FrameBox) -> FrameBox:
	return FrameBox.new(other.startFrame, other.endFrame, Vector2(other.offset), Vector2(other.area))

func is_active(frame: int) -> bool:
	return frame >= startFrame && frame <= endFrame
	
func as_rect(scale: Vector2) -> Rect2:
	var min_x = min((offset.x + area.x) * scale.x, offset.x * scale.x)
	var min_y = min((offset.y + area.y) * scale.y, offset.y * scale.y)
	
	return Rect2(min_x, min_y, abs(area.x * scale.x), abs(area.y * scale.y))

func _to_string() -> String:
	return "Start: %d, End: %d, Position: (%d,%d), Area: (%d,%d)" % [startFrame,endFrame,offset.x,offset.y,area.x,area.y]
