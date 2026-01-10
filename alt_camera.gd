class_name AltCamera
extends Camera3D


var focused_planet: Planet
var angle := 0.0
@export var speed := 3


func _process(delta: float) -> void:
	if focused_planet:
		angle += Input.get_axis("camera_left", "camera_right") * speed * delta
		angle = wrap(angle, 0, TAU)
		global_position = (
				focused_planet.global_position +
				Vector3(0, 0, focused_planet.cam_distance)
						.rotated(Vector3.UP, angle)
		)
		look_at(focused_planet.global_position)
