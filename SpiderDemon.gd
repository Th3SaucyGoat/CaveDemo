extends Node3D

@export var Player: Node3D

@onready var nav: NavigationAgent3D = $NavigationAgent3D

var velocity: Vector3

const SPEED = 2.0
const ACCEL = 20.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Player != null:
		nav.target_position = Player.global_position
		look_at(Player.global_position)
	#var input_dir = Input.get_axis("MoveForward", "MoveBackward")
	#input_dir = Vector3(input_dir.x, input_dir.y, 0)
	#translate(Vector3(0, 0, -input_dir)*SPEED*delta)
	#var side = Input.get_axis("MoveRight", "MoveLeft")
	#rotate_object_local(Vector3.UP, side*SPEED*delta)
	var direction: Vector3 = (nav.get_next_path_position() - global_position).normalized()
	velocity = velocity.lerp(direction *SPEED, ACCEL*delta)
	global_position += velocity *delta
	
