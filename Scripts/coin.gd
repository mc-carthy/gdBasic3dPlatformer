extends Area3D

@export var rotation_speed: float = 180.0
@export var bob_height: float = 0.2
@export var bob_speed: float = 5.0

@onready var start_y_pos: float = global_position.y

func _process(delta: float) -> void:
	rotation.y += deg_to_rad(rotation_speed) * delta
	
	var time = Time.get_unix_time_from_system()
	var y_pos = (1 + sin(time * bob_speed) / 2) * bob_height + start_y_pos
	
	global_position.y = y_pos

func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group('Player'):
		return
	
	body.increase_score(1)
	queue_free()
