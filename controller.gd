extends Node


@export var planets: Array[Planet]
@export var camera: AltCamera

var planet_index := 0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_planet_view"):
		camera.current = !camera.current
	if event.is_action_pressed("planet_next"):
		planet_index += 1
	if event.is_action_pressed("planet_prev"):
		planet_index -= 1
	planet_index = wrap(planet_index, 0, len(planets))
	
	if camera.current:
		camera.focused_planet = planets[planet_index]
