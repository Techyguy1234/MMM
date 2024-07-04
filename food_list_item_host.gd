extends Node2D

const item = preload("res://food_list_item.tscn")
# Called when the node enters the scene tree for the first time.
var items = []
var newitem
func _ready() -> void:
	setuplist(["bob","joe","billy","4","5","6","7","8","9","hopefully10"],1)



#type 1 = list editor  == reroll:invisible xbutton:visible deletes an item checkbutton:visible opens item editor
#type 2 = current dishes == reroll:visible randomizes the selected item xbutton:visible removes the item from the weekly list checkbutton:visible opens the item editor


func setuplist(source:Array,type:int):
	if type == 1:
		for x in source.size():
			newitem = item.instantiate()
			newitem.type = 1
			newitem.setdish(source[x])
			newitem.position.y = (x * 64) - (floori(((x) / 9))*576)
			newitem.position.x = floori(((x) / 9)) * 1152
			newitem.hide_reroll()
			items.append(newitem)
			$".".add_child(newitem)



func _on_right_pressed() -> void:
	for a in items:
		a.position.x -= 1152


func _on_left_pressed() -> void:
	for a in items:
		a.position.x += 1152
