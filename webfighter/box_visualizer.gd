@tool
extends Node2D

var interactable: Interactable
var current_frame: int = 0
var default_font: Font

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	default_font = ThemeDB.fallback_font

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	if interactable != null:
		for box in interactable.hitboxes:
			draw_rect(Rect2(box.offset, box.area), Color(Color.DARK_RED, 0.6))
		for box in interactable.hurtboxes:
			draw_rect(Rect2(box.offset, box.area), Color(Color.LIGHT_GREEN, 0.6))
			
		var message = "Frame: %d" % current_frame
		draw_string(default_font, Vector2.UP * 20 + Vector2.LEFT * 40, message, HORIZONTAL_ALIGNMENT_CENTER, -1, 8, Color.WHITE_SMOKE)
	else:
		print("interactable is null")


func set_interactable(_interactable: Interactable, frame: int):
	interactable = _interactable
	current_frame = frame
