extends Node2D

var test_action = ActionParser.new().load_file()

func _unhandled_input(event: InputEvent):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			run()
			
func run():
	test_action.step()
	var interactable = test_action.get_interactable()
	interactable.position_offset = Vector2(256,256)
	$Visualizer.set_interactable(interactable, test_action.current_frame)
	$Visualizer.queue_redraw()
