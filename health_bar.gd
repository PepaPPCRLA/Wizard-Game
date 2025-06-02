extends ColorRect

func _process(_delta):
	if not $"..".intent == "dead":
		position = $"../AnimatedSprite2D".position + Vector2(-27.5, -30)
