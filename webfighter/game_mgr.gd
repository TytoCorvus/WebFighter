extends Node2D

var test_action = ActionParser.new().load_file()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_just_pressed(KEY_SPACE):
		#run()
	pass

func run():
	var interactable = test_action.get_interactable()
	$Visualizer.set_interactable(interactable)
	$Visualizer.queue_redraw()
