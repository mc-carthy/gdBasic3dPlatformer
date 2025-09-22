extends CanvasLayer

@onready var HealthContainer: HBoxContainer = $HealthContainer
@onready var ScoreText: Label = $ScoreText

var hearts: Array = []

func _ready() -> void:
	var player = get_parent()
	
	player.OnTakeDamage.connect(update_hearts)
	player.OnUpdateScore.connect(update_score)
	
	hearts = HealthContainer.get_children()
	
	update_score(PlayerStats.score)
	update_hearts(player.health)

func update_hearts(num_hearts: int) -> void:
	for i in len(hearts):
		hearts[i].visible = i < num_hearts

func update_score(score: int) -> void:
	ScoreText.text = "Score: " + str(score)
