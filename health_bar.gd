extends ColorRect
var sprite_scale: float

func _ready() -> void:
	sprite_scale = ($"..".scale.x + $"..".scale.y) / 2

func _process(_delta) -> void:
	if $"..".intent != "dead":
		position = $"../AnimatedSprite2D".position + $"../AnimatedSprite2D".offset * sprite_scale + Vector2(-27.5, -45)
