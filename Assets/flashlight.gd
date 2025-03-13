extends SpotLight3D

var timeToFlicker = 1.0
var timeElasped = 0

var timeRange = [8.0, 20.0]

var initialEnergy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialEnergy = self.light_energy
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (not self.visible): return
	timeElasped += delta
	if timeElasped > timeToFlicker:
		# initiate flicker
		flicker()
		timeToFlicker = randfn(timeRange[0], timeRange[1])
		timeElasped = 0

func flicker():
	self.light_energy = 2.0
	await get_tree().create_timer(.15).timeout
	self.light_energy = 6.0
	await get_tree().create_timer(.07).timeout
	self.light_energy = 2.0
	await get_tree().create_timer(.2).timeout
	self.light_energy = initialEnergy
	
