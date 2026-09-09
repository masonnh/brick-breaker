extends CharacterBody2D

const SPEED = 500
const BOUNCINESS = 1.0
var screen_size: Vector2
var direction: Vector2 = Vector2(1, 1).normalized()

func _ready() -> void:
	direction = getRandomStartDirection()
	velocity = direction * SPEED
	screen_size = get_viewport_rect().size

func getRandomStartDirection() -> Vector2:
	var dir := Vector2(randf_range(-0.5, 0.5), randf_range(0, 1.0)) # Always starts downwards
	return dir.normalized()

func _physics_process(delta: float) -> void:
	# Move the ball
	#velocity = direction * SPEED
	position.x = clamp(position.x, 30, screen_size.x - 30)
	position.y = clamp(position.y, 30, screen_size.y + 35)
	
	# Bounce off paddle and bricks
	var collision_info := move_and_collide(velocity * delta)
	if collision_info:
		#var collider := collision_info.get_collider()
		var normal := collision_info.get_normal()
		velocity = velocity.bounce(normal) * BOUNCINESS
	
	if position.y > screen_size.y:
		# Respawn ball
		pass
