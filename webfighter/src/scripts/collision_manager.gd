extends Node

var root

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	root = get_tree().get_root()
	var p1 = BaseEntity.create_new(Vector2(-60,0), 1, "Player 1")
	var p2 = BaseEntity.create_new(Vector2(60,0), -1, "Player 2")
	add_child(p1)
	add_child(p2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_test_entity():
	var new_instance = load("res://src/scenes/interactable_entity.tscn").instantiate()
	add_child(new_instance)
	new_instance.set_owner(root)
	print("new instance added")
