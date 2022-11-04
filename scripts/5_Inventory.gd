extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer2/LocationStatus/LocationName.text = str(GameManager.locationName[GameManager.location])
	$VBoxContainer2/LocationStatus/LocationInfo.text = "Location Fee: $" + str(GameManager.locationFee[GameManager.location]) + "\n" + "Consumer Expectation: " + str(GameManager.locationExpectationNames[GameManager.location]) + "\n" + "Today's Weather: " + str(GameManager.weatherName[GameManager.weather]) + "\n" + "Today's Visitor Traffic: " + str(GameManager.rangeNames[GameManager.tourists]) + "\n" + "Today's Event: " + str(GameManager.eventName[GameManager.event])
	pass # Replace with function body.

func _bowlPrice(var amt):
	if(GameManager.bowlPrice + amt >= 5 && GameManager.bowlPrice + amt <= 30):
		GameManager.bowlPrice = GameManager.bowlPrice + amt
	$VBoxContainer2/Price/PriceHBox/CurrentPrice.text = "$" + str(GameManager.bowlPrice) + ".00"
	

func _on_Button_pressed(var SceneName):
		SceneManager.LoadScene(SceneName)
	
func loadPopup(var SceneName):
		SceneManager.LoadDialog(SceneName)
		
func _process(delta):	
	$VBoxContainer/Ahi/FreshAhi/FreshAmount.text = str(GameManager.freshAhi) + " lbs"
	$VBoxContainer/Ahi/FrozenAhi/FrozenAmount.text = str(GameManager.frozenAhi) + " lbs"
	$VBoxContainer/Seasoning/SeasoningAmount2.text = str(GameManager.seasoning)  + " lbs"
	$VBoxContainer/Rice/RiceAmount.text = str(GameManager.rice)  + " lbs"
	$VBoxContainer/BowlsUtensils/BowlsUtensilsAmount2.text = str(GameManager.utensils) + " sets"
	
	
