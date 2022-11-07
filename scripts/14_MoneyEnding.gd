extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Popup/Title.text = "Congratulations! You gained $%0.2f" % GameManager.money + " in "+ str(currentDay) + " days!"
	pass # Replace with function body.


func _on_Accept_pressed():
	SceneManager.LoadScene("17_Ending")
	pass # Replace with function body.


func _on_Decline_pressed():
	GameManager.MoneyOffer = 1
	queue_free()
	pass # Replace with function body.
