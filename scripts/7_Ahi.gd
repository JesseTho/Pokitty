extends Node2D


var freshahicart 
var frozenahicart
var freshamt = 0
var frozenamt = 0

	
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/FreshAhi/pricelabel.text = "Market Price: $"+ str(GameManager.freshPrice)
	$"VBoxContainer/Frozen Ahi/priceLabel".text = "Market Price: $"+ str(GameManager.frozenPrice)
	freshahicart = $"VBoxContainer/FreshAhi/BuyHBox/CurrentLabel"
	frozenahicart = $"VBoxContainer/Frozen Ahi/BuyHBox/CurrentLabel"

	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _cartUpdate(var freshFrozen, var addSubtract):
	
	if(freshFrozen == true && freshamt + addSubtract >= 0): #1 is fresh
		freshamt = freshamt + addSubtract
		freshahicart.text = str(freshamt) + " lb."
		
		
	if(freshFrozen == false	 && frozenamt + addSubtract >= 0 ): #0 is frozen
		frozenamt = frozenamt + addSubtract
		frozenahicart.text = str(frozenamt) + " lb."
		
		
	pass	
func buyAhi():
	var cost = (frozenamt * GameManager.frozenPrice) + (freshamt * GameManager.freshPrice)
	if(cost > GameManager.money):
		
		print("Can't Afford!")
	else: #Can Afford?
		GameManager.money = GameManager.money - cost
		GameManager.frozenAhi = GameManager.frozenAhi + frozenamt
		GameManager.freshAhi = GameManager.freshAhi + freshamt
		print("Bought: Fresh " + str(freshamt) + " lb.")
		print("Bought: Frozen " + str(frozenamt) + " lb.")
		print("Money left:$" + str(GameManager.money))
		frozenamt = 0
		freshamt = 0
		freshahicart.text = str(freshamt) + " lb."
		frozenahicart.text = str(frozenamt) + " lb."
		queue_free()
	
func _Exit():
	queue_free()
