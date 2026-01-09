class_name AltCamera
extends Camera3D


var focused_planet: Planet
var angle := 0.0
@export var speed := 0.05


func _process(_delta: float) -> void:
	if focused_planet:
		angle += Input.get_axis("camera_left", "camera_right") * speed
		angle = wrap(angle, 0, TAU)
		global_position = (
				focused_planet.global_position +
				Vector3(0, 0, focused_planet.cam_distance)
						.rotated(Vector3.UP, angle)
		)
		look_at(focused_planet.global_position)
