extends CharacterBody2D

const SPEED = 600
var screen_size: Vector2
var can_move := true

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	if !can_move:
		return

	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	move_and_collide(velocity * delta)
	
	if Input.is_action_just_pressed("restart_game"):
		get_tree().reload_current_scene()
