extends Node2D
const Main_save_location = "user://Current.fdlst"


var list_of_meals = []
var list_of_recipies = []
var list_of_required_groceries = []
var list_of_current_plan
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadlist()


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
	pass # Replace with function body.


func _on_view_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	$".".get_tree().quit()


func _on_save_pressed() -> void:
	savelist()
