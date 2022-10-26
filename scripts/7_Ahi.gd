extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func buyAhi(var FrozenAmount, var FreshAmount):
	var cost = (FrozenAmount * GameManager.frozenPrice) + (FreshAmount * GameManager.freshPrice)
	if(cost > GameManager.money):
		print("Can't Afford!")
	else: #Can Afford?
		GameManager.money = GameManager.money - cost
		GameManager.frozenAhi = GameManager.frozenAhi + FrozenAmount
		GameManager.freshAhi = GameManager.freshAhi + FreshAmount
		SceneManager.LoadScene("5_Inventory")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
