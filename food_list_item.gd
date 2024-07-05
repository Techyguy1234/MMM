extends Node2D

var type
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func delete_item():
	$".".queue_free()
func hide_checkmark():
	$CheckButton.queue_free()
func hide_x():
	$Xbutton.queue_free()
func hide_reroll():
	$RerollButton.queue_free()


func setdish(dish):
	$DishName.text = dish


func _on_check_button_pressed() -> void:
	$"/root/Liststorage".currently_editing = $"/root/Liststorage".list_of_meals.find($DishName.text)
	get_tree().change_scene_to_file("res://meal_name_recipie_groceries.tscn")


func _on_xbutton_pressed() -> void:
	var to_delete = $"/root/Liststorage".list_of_meals.find($DishName.text)
	$"/root/Liststorage".list_of_meals.pop_at(to_delete)
	$"/root/Liststorage".list_of_recipies.pop_at(to_delete)
	$"/root/Liststorage".list_of_required_groceries.pop_at(to_delete)
	delete_item()


func _on_reroll_button_pressed() -> void:
	$"/root/Liststorage".list_of_current_plan[$"/root/Liststorage".list_of_current_plan.find($"/root/Liststorage".list_of_meals.find($DishName.text))] = randi_range(0,($"/root/Liststorage".list_of_current_plan.size() - 1))
	get_tree().change_scene_to_file("res://main.tscn")
