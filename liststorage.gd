extends Node
var list_of_meals = ["bob"]
var list_of_recipies = ["rec"]
var list_of_required_groceries = ["aldi"]
var list_of_current_plan = []

var currently_editing
var current_list_item_type

var unopened = true

func os_do_something(aabbcc):
	OS.shell_open(aabbcc)

var email
