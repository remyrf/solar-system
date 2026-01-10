class_name Planet
extends Node3D


const SPEED_SCALE := 0.25


@export var orbit_speed := 1.0
@export var rotation_speed := 24.0
@export var sun: Node3D
@export var cam_distance: float
@export var angle := 0.0

var rotation_timer := 0.0

@onready var orbit_timer := randf_range(0, orbit_speed / SPEED_SCALE)
@onready var distance := global_position.distance_to(sun.global_position)
@onready var start_position := global_position
@onready var start_rotation := global_rotation

func _process(delta: float) -> void:
	orbit_timer += delta
	if orbit_timer >= orbit_speed / SPEED_SCALE:
		orbit_timer = 0
	
	var theta = orbit_timer / (orbit_speed / SPEED_SCALE) * TAU
	global_position = Vector3(
			distance, start_position.y, 0
	).rotated(Vector3.UP, theta)
	
	rotation_timer += delta
	if rotation_timer >= rotation_speed / SPEED_SCALE:
		rotation_timer = 0
	
	global_rotation = Vector3(
			0, rotation_timer / (rotation_speed / SPEED_SCALE) * TAU, 0
	)
	global_rotate(Vector3.RIGHT, angle)
