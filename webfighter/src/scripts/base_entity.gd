class_name BaseEntity
extends Node2D

const scene: PackedScene = preload("res://src/scenes/interactable_entity.tscn")

var current_interactable: Interactable
var test_action: Action 

func _init() -> void:
	test_action = ActionParser.new().load_file()
	print("InteractableEntity created")
	
	
static func create_new(position: Vector2, direction: int, name: String) -> BaseEntity:
	var new_entity: BaseEntity = scene.instantiate()
	new_entity.position = position
	new_entity.name = name
	if direction == -1:
		new_entity.scale = new_entity.scale * Vector2(-1, 1)
	return new_entity

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Advance frame"):
		test_action.step()
		render()
		
	if Input.is_action_just_pressed("Previous frame"):
		test_action.reverse()
		render()

func render():
	var interactable = test_action.get_interactable()
	interactable.position_offset = position
	$Visualizer.set_interactable(interactable, test_action.current_frame)
	$Visualizer.queue_redraw()

func get_interactable() -> Interactable:
	return current_interactable
	
