extends Camera3D

var intensity: float = 0.0

func _ready() -> void:
	get_parent().OnTakeDamage.connect(damage_shake)

func _process(delta: float) -> void:
	if intensity > 0:
		intensity = lerp(intensity, 0.0, 10 * delta)
		var offset: Vector2 = get_random_offset()
		h_offset = offset.x
		v_offset = offset.y

func damage_shake(health: int) -> void:
	intensity = 0.1

func get_random_offset() -> Vector2:
	return Vector2(randf_range(-intensity, intensity), randf_range(-intensity, intensity))
