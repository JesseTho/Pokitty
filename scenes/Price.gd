extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CurrentPrice.text = "$" + str(GameManager.bowlPrice) + ".00"



#func _process(delta):
#	pass


func _on_AddButton_pressed():
	GameManager.bowlPrice += 1
	$CurrentPrice.text = "$" + str(GameManager.bowlPrice) + ".00"
	

func _on_SubtractButton_pressed():
	GameManager.bowlPrice -= 1
	$CurrentPrice.text = "$" + str(GameManager.bowlPrice) + ".00"

