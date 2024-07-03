extends Node2D

var xpressed = false
var checkpressed = false
var rerollpressed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func delete_item():
	xpressed = false
	checkpressed = false
	$".".queue_free()
func hide_checkmark():
	$CheckButton.queue_free()
func hide_x():
	$Xbutton.queue_free()
func hide_reroll():
	$RerollButton.queue_free()


func _on_check_button_button_down() -> void:
	checkpressed = true
func _on_check_button_button_up() -> void:
	checkpressed = false
func _on_xbutton_button_down() -> void:
	xpressed = true
func _on_xbutton_button_up() -> void:
	xpressed = false
func _on_reroll_button_button_down() -> void:
	rerollpressed = true
func _on_reroll_button_button_up() -> void:
	rerollpressed = false
