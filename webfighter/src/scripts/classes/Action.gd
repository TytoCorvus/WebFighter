class_name Action
# Class that 

var duration: int
var current_frame: int

var hitboxes: Array[FrameBox]
var hurtboxes: Array[FrameBox]

func _init(_duration: int, _hitboxes: Array[FrameBox], _hurtboxes: Array[FrameBox]):
	duration = _duration
	hitboxes = _hitboxes
	hurtboxes = _hurtboxes
	
	current_frame = 0

func step():
	current_frame += 1
	var msg = "Stepping to frame %s"
	print(msg % current_frame)
	
func reverse(): 
	current_frame = max(current_frame - 1, 0)
	var msg = "Stepping to frame %s"
	print(msg % current_frame)

func get_interactable(reverse: bool) -> Interactable:
	var hit: Array[FrameBox] = hitboxes.filter(func(frame_box: FrameBox): return frame_box.is_active(current_frame))
	var hurt: Array[FrameBox] = hurtboxes.filter(func(frame_box: FrameBox): return frame_box.is_active(current_frame))
	
	if reverse:
		hit.assign(hit.map(_reverse_box))
		hurt.assign(hurt.map(_reverse_box))
		
	return Interactable.new(hit, hurt)

func _reverse_box(input: FrameBox) -> FrameBox:
	var copy = FrameBox.from(input)
	copy.area.x *= -1
	copy.offset.x *= -1
	print("Reversed box - offset: %s, area: %s" % [copy.offset, copy.area])
	return copy
