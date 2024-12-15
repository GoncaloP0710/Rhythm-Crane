extends Node

# Reference to the RichTextLabel node
@onready var rich_text_label = $"."

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the initial text of the RichTextLabel
	rich_text_label.set_text("[color=black] [wave] 0")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function to update the text of the RichTextLabel
func update_score(new_score: int) -> void:
	rich_text_label.set_text("[color=black] [wave] " + str(new_score + score))
	score = new_score + score

func _on_note_move_claw(direction: String) -> void:
	update_score(1)


func _on_crane_machine_tux_captured(new_score: int) -> void:
	update_score(10)
