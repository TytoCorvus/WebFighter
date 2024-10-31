@tool
extends Node2D

var interactable: Interactable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	print("_draw called")
	draw_line(Vector2.ZERO, Vector2.RIGHT * 5, Color.FLORAL_WHITE, 1)
	if interactable != null:
		print("Interactable!")
		for box in interactable.hitboxes:
			print("Drawing hitbox: %s" % box._to_string())
			draw_rect(Rect2(box.offset, box.area), Color.DARK_RED)
		for box in interactable.hurtboxes:
			print("Drawing hurtbox: %s" % box._to_string())
			draw_rect(Rect2(box.offset, box.area), Color.LIGHT_GREEN)
	else:
		print("interactable is null")


func set_interactable(_interactable: Interactable):
	interactable = _interactable
