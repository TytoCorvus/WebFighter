extends Node2D

var test_action = ActionParser.new().load_file()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Advance frame"):
		test_action.step()
		render()
		
	if Input.is_action_just_pressed("Previous frame"):
		test_action.reverse()
		render()

#func _unhandled_input(event: InputEvent):
	#if event is InputEventKey:
		#if event.pressed and event.keycode == KEY_SPACE:
			#run()
			

			
func render():
	var interactable = test_action.get_interactable()
	interactable.position_offset = Vector2(256,256)
	$Visualizer.set_interactable(interactable, test_action.current_frame)
	$Visualizer.queue_redraw()
