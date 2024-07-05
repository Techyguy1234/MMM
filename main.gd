extends Node2D
const Main_save_location = "user://Current.fdlst"

const meals_per_week = 4

var list_of_meals = []
var list_of_recipies = []
var list_of_required_groceries = []
var list_of_current_plan

var test = "mailto:" + "jo@gmail.com"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if $"/root/Liststorage".unopened:
		loadlist()
		$"/root/Liststorage".unopened = false
	#OS.alert("abc")
	#os_do_something("https://docs.godotengine.org/en/latest/?highlight=Godot%20Engine%3%docs")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func savelist():
	var file = FileAccess.open(Main_save_location,FileAccess.WRITE)
	list_of_meals = $"/root/Liststorage".list_of_meals
	list_of_recipies = $"/root/Liststorage".list_of_recipies
	list_of_required_groceries = $"/root/Liststorage".list_of_required_groceries
	list_of_current_plan = $"/root/Liststorage".list_of_current_plan
	file.store_var(list_of_meals,true)
	file.store_var(list_of_recipies,true)
	file.store_var(list_of_required_groceries,true)
	file.store_var(list_of_current_plan,true)


func loadlist():
	if FileAccess.file_exists(Main_save_location):
		var file = FileAccess.open(Main_save_location,FileAccess.READ)
		list_of_meals = file.get_var(true)
		list_of_recipies = file.get_var(true)
		list_of_required_groceries = file.get_var(true)
		list_of_current_plan = file.get_var(true)
		$"/root/Liststorage".list_of_meals = list_of_meals
		$"/root/Liststorage".list_of_recipies = list_of_recipies
		$"/root/Liststorage".list_of_required_groceries = list_of_required_groceries
		$"/root/Liststorage".list_of_current_plan = list_of_current_plan





func _on_newlist_pressed() -> void:
	$"/root/Liststorage".list_of_current_plan = []
	for a in ($"/root/Liststorage".list_of_meals.size()):
		$"/root/Liststorage".list_of_current_plan.append(a)
	
	for a in ($"/root/Liststorage".list_of_meals.size() - (meals_per_week)):
		$"/root/Liststorage".list_of_current_plan.pop_at(randi_range(0,$"/root/Liststorage".list_of_current_plan.size()-1))
	$"/root/Liststorage".current_list_item_type = 2
	get_tree().change_scene_to_file("res://food_list_item_host.tscn")

func _on_view_pressed() -> void:
	$"/root/Liststorage".current_list_item_type = 2
	get_tree().change_scene_to_file("res://food_list_item_host.tscn")


func _on_exit_pressed() -> void:
	$".".get_tree().quit()


func _on_save_pressed() -> void:
	savelist()


func _on_view_all_pressed() -> void:
	$"/root/Liststorage".current_list_item_type = 1
	get_tree().change_scene_to_file("res://food_list_item_host.tscn")

func generate_email():
	#OS.alert("started gen")
	$"/root/Liststorage".email = ("mailto:" + $MakeEmail/EmailInput.text.uri_encode() + "?subject=Your%20latest%20MMM%20list&body=")
	for n in meals_per_week:
		get_node("/root/Liststorage").email = get_node("/root/Liststorage").email + ("-" + get_node("/root/Liststorage").list_of_meals[(get_node("/root/Liststorage").list_of_current_plan[n])] + "\n" +get_node("/root/Liststorage").list_of_required_groceries[(get_node("/root/Liststorage").list_of_current_plan[n])] + "\n").uri_encode()
	#OS.alert("finished gen")
	get_tree().change_scene_to_file("res://emailsend.tscn")
	
	
	

func _on_make_email_pressed() -> void:
	generate_email()


func _on_import_export_pressed() -> void:
	get_tree().change_scene_to_file("res://csv_importer.tscn")
