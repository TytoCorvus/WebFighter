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

func get_interactable() -> Interactable:
	var hit = hitboxes.filter(func(frame_box: FrameBox): return frame_box.is_active(current_frame))
	var hurt = hurtboxes.filter(func(frame_box: FrameBox): return frame_box.is_active(current_frame))
	return Interactable.new(hit, hurt)
