extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("bob1,bob2,bob3")
	print(parse_csv_text("bob1,bob2,bob3"))
	print(array_to_csv(parse_csv_text("bob1,bob2,bob3")))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func parse_csv_text(text):
	var data = []
	for line in text.split("\n"):
		var row = line.replace("\n", "").split(",")  # Remove newline and split by comma
		data.append(row)
	return data

func array_to_csv(data):
	var csv_text = ""
	for row in data:
		var row_text = ""  # Initialize an empty string for the row
		for cell in row:
			# Add each cell, comma-separated
			row_text += cell + ","
		# Remove the trailing comma from the row (optional)
		if row_text != "":
			row_text = row_text.substr(0, row_text.length() - 1)
		row_text += "\n"  # Add newline at the end of the row
		csv_text += row_text
	# ... (rest of the function)
	
	# Optional: Remove trailing newline from the last row (if needed)
	csv_text = csv_text.substr(0, csv_text.length() - 1)
	return csv_text





func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_import_pressed() -> void:
	var parsedtext = parse_csv_text($TextEdit.text)
	for a in parsedtext[0].size():
		$"/root/Liststorage".list_of_meals.append(parsedtext[0][a])
		
		if parsedtext.size() == 3:
			$"/root/Liststorage".list_of_recipies.append(parsedtext[1][a])
			$"/root/Liststorage".list_of_required_groceries.append(parsedtext[2][a])
		
		else:
			$"/root/Liststorage".list_of_recipies.append("")
			$"/root/Liststorage".list_of_required_groceries.append("")


func _on_export_pressed() -> void:
	var exported = []
	exported.append($"/root/Liststorage".list_of_meals)
	exported.append($"/root/Liststorage".list_of_recipies)
	exported.append($"/root/Liststorage".list_of_required_groceries)
	$TextEdit.text = array_to_csv(exported)
	DisplayServer.clipboard_set(array_to_csv(exported))
