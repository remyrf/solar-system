extends Node


@export var planets: Array[Focusable]
@export var camera: AltCamera

var planet_index := 0

@onready var planet_name: Label = %PlanetName
@onready var ui: Control = %UI


func _process(_delta: float) -> void:
	planet_index = wrap(planet_index, 0, len(planets))
	
	if camera.current:
		camera.focused_planet = planets[planet_index]
		planet_name.text = planets[planet_index].name
	
	ui.visible = camera.current


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_planet_view"):
		camera.current = !camera.current
	if event.is_action_pressed("planet_next"):
		planet_index += 1
	if event.is_action_pressed("planet_prev"):
		planet_index -= 1


func _on_left_pressed() -> void:
	planet_index -= 1


func _on_right_pressed() -> void:
	planet_index += 1
