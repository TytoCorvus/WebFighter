extends Node

var root

var p1: BaseEntity
var p2: BaseEntity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	root = get_tree().get_root()
	p1 = BaseEntity.create_new(Vector2(-60,0), 1, "Player 1")
	p2 = BaseEntity.create_new(Vector2(60,0), -1, "Player 2")
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


func detect_intersection() -> IntersectionType:
	var p1_interactable = p1.get_interactable()
	var p2_interactable = p2.get_interactable()
	
	var result = p1_interactable.intersects(p2_interactable)
	print(result._to_string())
	
	return result
	
