extends Node
@onready var send = $"/root/Liststorage".email

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	OS.shell_open(send)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
