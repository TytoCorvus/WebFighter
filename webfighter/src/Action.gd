class_name Action

var duration
var currentFrame

var sprite
var hitboxes
var hurtboxes

func step():
	var msg = "Stepping to frame %s"
	print(msg % currentFrame)
