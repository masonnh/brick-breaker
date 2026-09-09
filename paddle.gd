extends CharacterBody2D

const SPEED = 600
var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	velocity.y = 0
	position += velocity * delta
	position.x = clamp(position.x, 125, screen_size.x - 125)
