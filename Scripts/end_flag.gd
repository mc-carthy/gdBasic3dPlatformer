extends Area3D

@export var scene_to_load: PackedScene

func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group('Player'):
		return
	
	call_deferred('load_new_scene')

func load_new_scene() -> void:
	get_tree().change_scene_to_packed(scene_to_load)
