extends Node2D
var list_of_meals = []
var list_of_recipies = []
var list_of_required_groceries = []

var current_meal
var current_recipie
var current_groceries

var ID
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$NameEditor.hide()
	$RecipieEditor.hide()
	$GroceriesEditor.hide()
	$Save.hide()
	loadItem((get_node("/root/Liststorage").currently_editing))
	

func loadItem(itemID):
	list_of_meals = $"/root/Liststorage".list_of_meals
	list_of_recipies = $"/root/Liststorage".list_of_recipies
	list_of_required_groceries = $"/root/Liststorage".list_of_required_groceries
	current_meal = list_of_meals[itemID]
	current_recipie = list_of_recipies[itemID]
	current_groceries = list_of_required_groceries[itemID]
	
	$Name.text = current_meal
	$Recipie.text = current_recipie
	$Groceries.text = current_groceries
	
	ID = itemID


func edit():
	$NameEditor.show()
	$NameEditor.text = $Name.text
	$Name.hide()
	$RecipieEditor.show()
	$RecipieEditor.text = $Recipie.text
	$Recipie.hide()
	$GroceriesEditor.show()
	$GroceriesEditor.text = $Groceries.text
	$Groceries.hide()
	$Save.show()
	$Edit.hide()

func save():
	$Name.show()
	$Name.text = $NameEditor.text
	$NameEditor.hide()
	$Recipie.show()
	$Recipie.text = $RecipieEditor.text
	$RecipieEditor.hide()
	$Groceries.show()
	$Groceries.text = $GroceriesEditor.text
	$GroceriesEditor.hide()
	$Edit.show()
	$Save.hide()

func exit(itemID):
	list_of_meals[itemID] = $Name.text
	list_of_recipies[itemID] = $Recipie.text
	list_of_required_groceries[itemID] = $Groceries.text
	
	$"/root/Liststorage".list_of_meals = list_of_meals
	$"/root/Liststorage".list_of_recipies = list_of_recipies
	$"/root/Liststorage".list_of_required_groceries = list_of_required_groceries
	get_tree().change_scene_to_file("res://main.tscn")





func _on_edit_pressed() -> void:
	edit()


func _on_save_pressed() -> void:
	save()


func _on_exit_pressed() -> void:
	exit(ID)
