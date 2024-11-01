extends Node2D

var current_interactable: Interactable
var test_action: Action 

func _init() -> void:
	test_action = ActionParser.new().load_file()
	print("InteractableEntity created")
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Advance frame"):
		test_action.step()
		render()
		
	if Input.is_action_just_pressed("Previous frame"):
		test_action.reverse()
		render()

func render():
	var interactable = test_action.get_interactable()
	interactable.position_offset = Vector2(256,256)
	$Visualizer.set_interactable(interactable, test_action.current_frame)
	$Visualizer.queue_redraw()

func get_interactable() -> Interactable:
	return current_interactable
	
