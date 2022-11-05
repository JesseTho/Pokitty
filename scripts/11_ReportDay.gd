extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var expiredAhi 

# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	$Background/Title.text = "End of Day " + str(GameManager.currentDay) + " Report"
	expiredAhi = GameManager.freshAhi
	GameManager.freshAhi = 0
	
	$Background/NumPokeBowls.text = str(GameManager.pokeSold)
	$Background/NumLikes.text = str(GameManager.likesDay)
	
	GameManager.pokeSold = 0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	SceneManager.LoadScene("16_RemainingInventory")
