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
