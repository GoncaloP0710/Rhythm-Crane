extends Node2D

# Reference to the line
var line = null

# Sprite reference
@onready var sprite = $direction

# Movement speed for the node in pixels per second
@export var MOVE_SPEED = 200  # Speed in pixels per second

var hasPassedLine = false
var direction = ""  # Direction of movement as a string ("left", "right", "up", "down")

# Signal to notify about position changes
signal move_claw(direction : String)

func _ready() -> void:
	# Retrieve the direction and line from metadata
	direction = get_meta("direction")
	line = get_meta("line")
	
	# Assign the correct texture based on the direction
	if direction == "left":
		sprite.texture = preload("res://textures/left.png")
	elif direction == "right":
		sprite.texture = preload("res://textures/right.png")
	elif direction == "up":
		sprite.texture = preload("res://textures/up.png")
	elif direction == "down":
		sprite.texture = preload("res://textures/down.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Move the node to the left
	position.x -= MOVE_SPEED * delta

	# Check if the node has passed the line to its left
	if not hasPassedLine and line and position.x < line.position.x:
		
		# Collect inputs when a key is pressed (not held)
		if Input.is_action_pressed("left") && direction == "left" :
			emit_signal("move_claw", "left")
		elif Input.is_action_pressed("right") && direction == "right" :
			print("asokdjkmasoijdmoasidjaoijkasdi")
			emit_signal("move_claw", "right")
		elif Input.is_action_pressed("up") && direction == "up" :
			emit_signal("move_claw", "up")
		elif Input.is_action_pressed("down") && direction == "down" :
			emit_signal("move_claw", "down")
				
		print("Node has passed the line to its left.")
		hasPassedLine = true
		queue_free()  # Remove the node from the scene
