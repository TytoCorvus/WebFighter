class_name Action
# Class that 

var duration: int
var currentFrame: int

var sprite
var hitboxes: Array[FrameBox]
var hurtboxes: Array[FrameBox]

func _init(duration, hitboxes, hurtboxes):
	currentFrame = 0

func step():
	currentFrame += 1
	var msg = "Stepping to frame %s"
	print(msg % currentFrame)

func get_interactable() -> Interactable:
	var hit = hitboxes.filter(func(frame_box): frame_box.is_active(currentFrame))
	var hurt = hurtboxes.filter(func(frame_box): frame_box.is_active(currentFrame))
	return Interactable.new(hit, hurt)
