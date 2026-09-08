extends Area2D

const SPEED = 500
var velocity

func _ready() -> void:
	velocity = SPEED * getRandomStartDirection()

func getRandomStartDirection() -> Vector2:
	var dir = Vector2(randf_range(-1.0, 1.0), randf_range(0, 1.0)) # Always starts downwards
	return dir.normalized()

func _physics_process(delta: float) -> void:
	position += velocity * delta
