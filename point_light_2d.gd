extends PointLight2D
@onready var sprite = $".."
var sprite_scale: float

func _ready() -> void:
	var sprite_scale: float = ($"..".scale.x + $"..".scale.y) / 2

func _process(delta: float) -> void:
	position = sprite.offset * sprite_scale
