extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	StartDay()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func StartDay():
	#Deduct Location Fee
	GameManager.money = GameManager.money - GameManager.locationFee[GameManager.location]
	print("Balance after location fee is: $" + str(GameManager.money))
	GameManager.ApplyVisitorCount()
	print("Today's Visitors: " + str(GameManager.visitors))
