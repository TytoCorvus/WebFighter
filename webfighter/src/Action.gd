class_name Action
# Class that 

var duration: int
var currentFrame: int

var hitboxes: Array[FrameBox]
var hurtboxes: Array[FrameBox]

func _init(_duration: int, _hitboxes: Array[FrameBox], _hurtboxes: Array[FrameBox]):
	duration = _duration
	hitboxes = _hitboxes
	hurtboxes = _hurtboxes
	
	currentFrame = 0

func step():
	currentFrame += 1
	var msg = "Stepping to frame %s"
	print(msg % currentFrame)

func get_interactable() -> Interactable:
	var hit = hitboxes.filter(func(frame_box: FrameBox): return frame_box.is_active(currentFrame))
	var hurt = hurtboxes.filter(func(frame_box: FrameBox): return frame_box.is_active(currentFrame))
	return Interactable.new(hit, hurt)
