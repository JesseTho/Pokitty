extends Node2D

var feeHigh = 10;
var feeLow = 5;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Button_pressed(var SceneName, var location):
	SceneManager.LoadScene(SceneName)
	GameManager.location = location
	
	
	if(GameManager.location == "Wakiki"):
		GameManager.money = GameManager.money - feeHigh;
		print("Paid " + str(feeHigh))
		
	if(GameManager.location == "Kalihi"):
		GameManager.money = GameManager.money - feeLow;
		print("Paid " + str(feeLow))
	if(GameManager.location == "Kakaako"):
		GameManager.money = GameManager.money - feeHigh;
		print("Paid " + str(feeHigh))
		
	if(GameManager.location == "NorthShore"):
		GameManager.money = GameManager.money - feeLow;
		print("Paid " + str(feeLow))
		
	print("Location:" + str(GameManager.location) + " Money:" + str(GameManager.money) )
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
