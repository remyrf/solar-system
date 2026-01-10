extends Planet


@export var particles_count := 1000
@export var particle_distance := 15.0
@export var random_range := 5.0
@export var min_scale := 0.05
@export var max_scale := 0.75

@export var particle_scenes: Array[PackedScene]

func _ready() -> void:
	for x in range(particles_count):
		var node: Node3D = (
			particle_scenes[x % len(particle_scenes)].instantiate()
		)
		node.position = (
			(
				Vector3.RIGHT.rotated(Vector3.UP, randf_range(0, TAU)) *
				(particle_distance + randf_range(-random_range, random_range))
			)
		)
		node.scale = Vector3.ONE * randf_range(min_scale, max_scale)
		node.rotation = Vector3(
			randf_range(0, TAU),
			randf_range(0, TAU),
			randf_range(0, TAU)
		)
		add_child(node)
