extends Node2D

# Reference to the line
@onready var line = $"../finishLine"

# Sprite reference
@onready var sprite = $direction

# Movement speed for the node in pixels per second
@export var MOVE_SPEED = 200  # Speed in pixels per second

var hasPassedLine = false
var direction = ""  # Direction of movement as a string ("left", "right", "up", "down")

func _ready() -> void:
	# Assign a random direction as a string
	var directions = ["left", "right", "up", "down"]
	direction = directions[randi() % directions.size()]
	
	if direction == "left":
		sprite.texture = preload("res://textures/left.png")
	if direction == "right":
		sprite.texture = preload("res://textures/right.png")
	if direction == "up":
		sprite.texture = preload("res://textures/up.png")
	if direction == "down":
		sprite.texture = preload("res://textures/down.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Move the node to the left
	position.x -= MOVE_SPEED * delta

	# Check if the node has passed the line to its left
	if not hasPassedLine and position.x < line.position.x:
		print("Node has passed the line to its left.")
		hasPassedLine = true
		queue_free()  # Remove the node from the scene
