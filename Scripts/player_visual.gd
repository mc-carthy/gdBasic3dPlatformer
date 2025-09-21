extends MeshInstance3D

@export var rotation_rate: float = 20.0

@onready var player: CharacterBody3D = get_parent()

var target_y_rot: float = 0.0

func _process(delta: float) -> void:
	smooth_rotation(delta)
	move_bob(delta)

func smooth_rotation(delta: float) -> void:
	var vel = player.velocity
	
	if vel.x != 0 or vel.z != 0:
		target_y_rot = atan2(-vel.x, -vel.z)
	
	rotation.y = lerp_angle(rotation.y, target_y_rot, rotation_rate * delta)

func move_bob(delta: float) -> void:
	var move_speed = player.velocity.length()
	
	if move_speed < 0.1 or not player.is_on_floor():
		scale.y = 1
		return
	
	var time = Time.get_unix_time_from_system()
	var y_scale = 1 + sin(time * 30) * 0.05
	scale.y = y_scale
