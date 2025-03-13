extends Node3D

var offset: float = 10


@onready var parent = get_parent()
@onready var previous_pos = parent.global_position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = parent.global_position - previous_pos
	self.global_position = parent.global_position+velocity*offset
	previous_pos = parent.global_position
