extends ColorRect
func _process(delta: float) -> void:
	$".".scale.x = (($"../../../World/Wizard".mana / $"../../../World/Wizard".max_mana) + scale.x * 3) / 4
