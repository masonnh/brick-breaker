extends CanvasLayer

var score := 0
@onready var max_score := 100 * get_tree().get_nodes_in_group("bricks").size()

func increase_score(inc_amount: int) -> void:
	score += inc_amount
	%ScoreText.text = "Score: %d" % score
	
	if score >= max_score:
		%VictoryScreen.visible = true
		get_tree().paused = true
