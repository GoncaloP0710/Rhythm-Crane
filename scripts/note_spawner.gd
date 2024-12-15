extends Node2D

# Reference to the note scene or node
@onready var note_scene = preload("res://scenes/actors/note.tscn")

# Reference to the file with the info about the notes timer
@onready var file_path = "res://scripts/Songs/zeldinha.txt"

# Reference to the line
@onready var line = $"../finishLine"

# Dictionary to map direction numbers to strings
var direction_map = {
	0: "left",
	1: "right",
	2: "up",
	3: "down"
}

# Dictionary to store the note data
var notes_data = {}

# Track the elapsed time
var elapsed_time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Read and parse the text file
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		while not file.eof_reached():
			var line = file.get_line()
			var parts = line.split(" ")
			if parts.size() == 2:
				var time = parts[0].to_float()
				var direction = parts[1].to_int()
				notes_data[time] = direction_map[direction]
				print("Stored note at time: ", time, " with direction: ", direction_map[direction])
		file.close()
	else:
		print("File not found: ", file_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time += delta
	
	# Check if there are any notes to create at the current time
	for time in notes_data.keys():
		if elapsed_time >= time:
			_create_note_at_time(time)
			# Remove the note from the dictionary to avoid creating it again
			notes_data.erase(time)

func _create_note_at_time(time: float) -> void:
	var direction = notes_data[time]
	var note_instance = note_scene.instantiate()
	note_instance.set_meta("direction", direction)
	note_instance.set_meta("line", line)
	note_instance.connect("move_claw", Callable($"../Claw", "_on_note_move_claw"))
	
		# Set the initial position of the note based on the direction
	match direction:
		"up":
			note_instance.position = Vector2(529, -115)  # Example position for "up"
		"down":
			note_instance.position = Vector2(529, 68)  # Example position for "down"
		"left":
			note_instance.position = Vector2(529, -7)  # Example position for "left"
		"right":
			note_instance.position = Vector2(529, -62)  # Example position for "right"
	
	add_child(note_instance)
	print("Created note at time: ", time, " with direction: ", direction)
