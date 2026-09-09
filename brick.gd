extends StaticBody2D

func hit() -> void:
	queue_free() # delete when hit
