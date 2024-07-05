extends Node2D

const item = preload("res://food_list_item.tscn")
# Called when the node enters the scene tree for the first time.
var items = []
var newitem
func _ready() -> void:
	$Add.hide()
	setuplist(get_node("/root/Liststorage").current_list_item_type)



#type 1 = list editor  == reroll:invisible xbutton:visible deletes an item checkbutton:visible opens item editor
#type 2 = current dishes == reroll:visible randomizes the selected item xbutton:visible removes the item from the weekly list checkbutton:visible opens the item editor

func setuplist(type:int):
	if type == 1:
		$Add.show()
		for x in get_node("/root/Liststorage").list_of_meals.size():
			newitem = item.instantiate()
			newitem.type = 1
			newitem.setdish(get_node("/root/Liststorage").list_of_meals[x])
			newitem.position.y = (x * 64) - (floori(((x) / 9))*576)
			newitem.position.x = floori(((x) / 9)) * 1152
			newitem.hide_reroll()
			items.append(newitem)
			$".".add_child(newitem)
	
	
	
	if type == 2:
		for x in get_node("/root/Liststorage").list_of_current_plan.size():
			newitem = item.instantiate()
			newitem.type = 2
			newitem.setdish(get_node("/root/Liststorage").list_of_meals[($"/root/Liststorage".list_of_current_plan[x])])
			newitem.position.y = (x * 64) - (floori(((x) / 9))*576)
			newitem.position.x = floori(((x) / 9)) * 1152
			newitem.hide_x()
			items.append(newitem)
			$".".add_child(newitem)
	
	
	
	
	
	
	
	
	
	



func _on_right_pressed() -> void:
	for a in items:
		a.position.x -= 1152


func _on_left_pressed() -> void:
	for a in items:
		a.position.x += 1152


func _on_add_pressed() -> void:
	for a in items:
		a.delete_item()
	$"/root/Liststorage".list_of_meals.append("")
	$"/root/Liststorage".list_of_recipies.append("")
	$"/root/Liststorage".list_of_required_groceries.append("")
	$"/root/Liststorage".currently_editing = $"/root/Liststorage".list_of_meals.size() -1
	get_tree().change_scene_to_file("res://meal_name_recipie_groceries.tscn")


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
