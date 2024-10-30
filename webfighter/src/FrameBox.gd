class_name FrameBox

var startFrame: int
var endFrame: int

# The position from the origin
var offset: Vector2
# The descriptor of the size of the box
var area: Vector2

func _init(startFrame, endFrame, offset, area):
	pass

func is_active(frame: int):
	if frame >= startFrame && frame <= endFrame:
		return true
	else:
		return false
