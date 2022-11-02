extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _bowlPrice(var amt):
	if(GameManager.bowlPrice + amt >= 5 && GameManager.bowlPrice + amt <= 30):
		GameManager.bowlPrice = GameManager.bowlPrice + amt
	$VBoxContainer2/Price/PriceHBox/CurrentPrice.text = "$" + str(GameManager.bowlPrice) + ".00"
	

func _on_Button_pressed(var SceneName):
		SceneManager.LoadScene(SceneName)
	
func loadPopup(var SceneName):
		SceneManager.LoadDialog(SceneName)
