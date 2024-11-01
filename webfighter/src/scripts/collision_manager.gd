extends Node

var root

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	root = get_tree().get_root()
	create_test_entity()
	create_test_entity()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_test_entity():
	var new_instance = load("res://src/scenes/interactable_entity.tscn").instantiate()
	add_child(new_instance)
	new_instance.set_owner(root)
	print("new instance added")
