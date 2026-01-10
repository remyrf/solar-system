extends Button

@onready var label: Label = $"../Label"
@onready var loading: Label = $"../Loading"

func _on_button_down() -> void:
	label.visible = false
	visible = false
	loading.visible = true
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://main_scene.tscn")
