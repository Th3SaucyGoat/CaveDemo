extends RayCast3D

var step_target: Node3D

func _ready():
	step_target = get_child(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var hit = get_collision_point()
	if hit:
		step_target.global_position = hit
