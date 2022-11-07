extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Popup/Title.text = "Congratulations! You have completed " + str(GameManager.days) + " days!"
	pass # Replace with function body.


func _on_Accept_pressed():
	SceneManager.LoadScene("0_Root")
	pass # Replace with function body.


func _on_Decline_pressed():
	SceneManager.LoadScene("0_Root")
	pass # Replace with function body.
