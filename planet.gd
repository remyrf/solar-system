class_name Planet
extends Node3D


@export var orbit_speed := 0.5
@export var sun: Node3D
@export var alt_camera: Camera3D
@export var cam_distance: float

@onready var distance := global_position.distance_to(sun.global_position)
@onready var start_position := global_position

var timer := 0.0

func _process(delta: float) -> void:
	timer += delta
	if timer >= orbit_speed / 3:
		timer = 0
	
	var theta = timer / (orbit_speed / 3) * TAU
	global_position = Vector3(
			distance, start_position.y, 0
	).rotated(Vector3.UP, theta)
	# TODO: make the planets spin around their origins as well
