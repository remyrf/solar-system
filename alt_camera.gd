class_name AltCamera
extends Camera3D


@export var speed := 3

var focused_planet: Focusable
var angle := 0.0

@onready var spin_left: Button = %SpinLeft
@onready var spin_right: Button = %SpinRight


func _process(delta: float) -> void:
	if focused_planet:
		var movement := Input.get_axis("camera_left", "camera_right")
		if spin_left.button_pressed:
			movement -= 1
		if spin_right.button_pressed:
			movement += 1
		angle += movement * speed * delta
		angle = wrap(angle, 0, TAU)
		global_position = (
				focused_planet.global_position +
				Vector3(0, 0, focused_planet.cam_distance)
						.rotated(Vector3.UP, angle)
		)
		look_at(focused_planet.global_position)
