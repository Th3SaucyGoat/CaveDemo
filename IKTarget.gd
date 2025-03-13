extends Marker3D

@export var step_target: Node3D
@export var step_distance: float = 3.0

var isStepping: bool = false

var tween: Tween

var stepDuration: float = .05
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#stepDuration = stepDuration/get_parent().get_parent().name
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if abs(global_position.distance_to(step_target.global_position)) > step_distance:
		if (tween and tween.is_running()):
			tween.pause()
			tween.custom_step(1.0)
		step()
	
func step():
	var target_pos = step_target.global_position
	var half_way = (global_position + step_target.global_position)/2
	tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", half_way + owner.basis.y, stepDuration)
	tween.tween_property(self, "global_position", target_pos, stepDuration)
