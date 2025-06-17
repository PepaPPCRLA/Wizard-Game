extends Area2D

var facing: int
var initialSpeed: int
var exploded: bool = false
var last_position: Vector2
@onready var Sprite: AnimatedSprite2D = $"AnimatedSprite2D"
@onready var Wizard: CharacterBody2D = $"../Wizard"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not facing:
		facing = -1000
		position.y = 1000
	elif facing == -1:
		Sprite.rotation_degrees = -45
		$CollisionShape2D.position.x = -10
		position = Wizard.position + Vector2(10,10)
	else:
		position = Wizard.position + Vector2(10,10)
	Sprite.modulate.a = 0
	get_tree().create_tween().tween_property(Sprite, "modulate:a", 1, 0.25)
	await get_tree().create_timer(5).timeout
	if not facing == -1000:
		explode()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if not facing == -1000:
		move(float(1) / Engine.physics_ticks_per_second * Engine.time_scale)
		visible = true
		if !exploded:
			$"Hit Detection Improver".target_position = last_position - global_position
			last_position = $"Hit Detection Improver".global_position
			$"Hit Detection Improver".enabled = true
			if $"Hit Detection Improver".is_colliding() and $"Hit Detection Improver".get_collider() != $"../Wizard":
				if $"Hit Detection Improver".get_collider() != $"../Foreground":
					$"Hit Detection Improver".get_collider().damage(10)
				explode()

			if $"Hit Prediction".is_colliding() and $"Hit Prediction".get_collider() != $"../Wizard":
				if $"Hit Prediction".get_collider() != $"../Foreground":
					$"Hit Prediction".get_collider().damage(10)
				explode()


func move(delta):
	if !exploded:
		position.x += (initialSpeed + 750) * delta * facing
		$"Hit Prediction".target_position.x = ((initialSpeed + 750) * delta * facing)



func explode():
	if !exploded:
		exploded = true
		$AnimatedSprite2D.queue_free()
		$CollisionShape2D.queue_free()
		$"Hit Prediction".queue_free()
		$"Hit Detection Improver".queue_free()
		$Explosion.position *= facing
		$Explosion.emitting = true
		await get_tree().create_timer(5).timeout
		queue_free()
