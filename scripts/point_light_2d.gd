extends PointLight2D

func _process(_delta: float) -> void:
	$".".position = $"..".offset * $"..".scale.x
