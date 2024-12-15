extends Node

# Reference to the claw node
@onready var claw = $"../Claw" 

# Reference to the tux node
@onready var tux = $"../Tux"

# Variable to save the claw's position
var claw_position = Vector2.ZERO

# Variable to save the random target position
var target_position = Vector2.ZERO

# Constants for grid size
const GRID_SIZE_X = 32
const GRID_SIZE_Y = 16
const GRID_SIZE_COLUMNS = 5
const GRID_SIZE_ROWS = 3

# Camera position
var cameraPos = 1
# Reference to the Sprite2D node
@onready var sprite = $machine

# Signal to notify about position changes
signal camera_position_changed(new_position: int)

# Signal to notify about position changes
signal tux_captured(new_score : int)

func _ready() -> void:
	# Generate a random target position within the grid
	randomize()
	target_position = Vector2(randi() % GRID_SIZE_COLUMNS * GRID_SIZE_X, randi() % GRID_SIZE_ROWS * GRID_SIZE_Y)
	print("Target position: ", target_position)
	
	# Set the Tux position to the target position
	tux.position = target_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the space bar is pressed
	if Input.is_action_just_pressed("ui_select"):  # Default action for space bar
		if claw_position == target_position:
			print("Claw is on the target position!")
			target_position = Vector2(randi() % GRID_SIZE_COLUMNS * GRID_SIZE_X, randi() % GRID_SIZE_ROWS * GRID_SIZE_Y)
			print("Target position: ", target_position)
			emit_signal("tux_captured", 5)
			
			# Set the Tux position to the target position
			tux.position = target_position
		else:
			print("Claw is not on the target position.")
			
	# Check if the keys 1, 2, or 3 are pressed
	if Input.is_action_just_pressed("camera1"):
		cameraPos = 1
		sprite.texture = preload("res://textures/claw_machine.png")
		emit_signal("camera_position_changed", cameraPos)
		print("Camera position changed to: ", cameraPos)
	elif Input.is_action_just_pressed("camera2"):
		cameraPos = 2
		emit_signal("camera_position_changed", cameraPos)
		print("Camera position changed to: ", cameraPos)
	elif Input.is_action_just_pressed("camera3"):
		cameraPos = 3
		sprite.texture = preload("res://textures/claw_machine_3.png")
		emit_signal("camera_position_changed", cameraPos)
		print("Camera position changed to: ", cameraPos)

# Called when the claw's position changes
func _on_claw_position_changed(new_position: Vector2) -> void:
	claw_position = new_position
	print("Claw moved to position: ", new_position)
