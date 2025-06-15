extends PointLight2D

func _process(delta: float) -> void:
	$".".position = $"..".offset * $"..".scale.x
