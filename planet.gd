class_name Planet
extends Focusable


const ORBIT_SPEED_SCALE := 0.25
const ROTATION_SPEED_SCALE := 3.0


@export var orbit_speed := 1.0
@export var tidally_locked := false
@export var rotation_speed := 24.0
@export var sun: Node3D
@export var angle := 0.0

var rotation_timer := 0.0

@onready var orbit_timer := randf_range(0, orbit_speed / ORBIT_SPEED_SCALE)
@onready var distance := global_position.distance_to(sun.global_position)
@onready var start_position := global_position
@onready var start_rotation := global_rotation

func _process(delta: float) -> void:
	orbit_timer += delta
	if orbit_timer >= orbit_speed / ORBIT_SPEED_SCALE:
		orbit_timer = 0
	
	var theta = orbit_timer / (orbit_speed / ORBIT_SPEED_SCALE) * TAU
	global_position = Vector3(
			distance, start_position.y, 0
	).rotated(Vector3.UP, theta) + sun.global_position
	
	if tidally_locked:
		look_at(sun.global_position)
	else:
		rotation_timer += delta
		if rotation_timer >= rotation_speed / ROTATION_SPEED_SCALE:
			rotation_timer = 0
		
		global_rotation = Vector3(
				0, rotation_timer / (rotation_speed / ROTATION_SPEED_SCALE) * TAU, 0
	)
	global_rotate(Vector3.RIGHT, angle)
