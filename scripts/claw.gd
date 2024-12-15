extends Node2D

# Constants for grid size and movement speed
const GRID_SIZE_X = 32  # Size of one tile in pixels along the X-axis
const GRID_SIZE_Y = 16  # Size of one tile in pixels along the Y-axis
@export var MOVEMENT_SPEED = 200  # Speed in pixels per second

# Variables for movement
var target_position = Vector2.ZERO  # The position the character is moving toward
var input_queue = []  # A queue to store movement inputs

# Signal to notify about position changes
signal position_changed(new_position: Vector2)

# Variables to track the previous position
var previous_position = Vector2.ZERO

# 2D array to represent the grid (10x10 grid)
var grid = []
const GRID_SIZE_COLUMNS = 5
const GRID_SIZE_ROWS = 3

# Camera position
var cameraPos = 1

func _ready():
	# Initialize the grid
	for i in range(GRID_SIZE_COLUMNS):
		grid.append([])
		for j in range(GRID_SIZE_ROWS):
			grid[i].append(Vector2(i, j))
	
	# Start the target position at the current position
	target_position = position.snapped(Vector2(GRID_SIZE_X, GRID_SIZE_Y))
	previous_position = position

func _process(delta):
	# Process the next input if the node is at the target position
	if input_queue.size() > 0:
		var next_mov = input_queue.pop_front()
		var new_position = position + Vector2(next_mov.x * GRID_SIZE_X, next_mov.y * GRID_SIZE_Y)
		
		# Ensure the new position is within the grid limits
		if new_position.x >= 0 and new_position.x < GRID_SIZE_COLUMNS * GRID_SIZE_X and new_position.y >= 0 and new_position.y < GRID_SIZE_ROWS * GRID_SIZE_Y:
			target_position = new_position

	# Move smoothly toward the target position at the defined speed
	position = position.move_toward(target_position, MOVEMENT_SPEED * delta)
	
	# Emit the signal when the position changes
	if position != previous_position:
		emit_signal("position_changed", position)
		previous_position = position

func _on_crane_machine_camera_position_changed(new_position: int) -> void:
	cameraPos = new_position
	print("Camera moved to position: ", new_position)

func _on_note_move_claw(direction: String) -> void:
	# Collect inputs when a key is pressed (not held)
	if direction == "left" :
		input_queue.append(Vector2(-1, 0))
	elif direction == "right" :
		input_queue.append(Vector2(1, 0))
	elif direction == "up" :
		input_queue.append(Vector2(0, -1))
	elif direction == "down" :
		input_queue.append(Vector2(0, 1))
