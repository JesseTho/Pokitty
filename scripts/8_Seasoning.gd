extends Node2D


var Sml
var Med
var Lrg

var smlAmt = 0
var medAmt = 0
var lrgAmt = 0

func _ready():
	
	Sml = $VBoxContainer/SmallOrder/BuyHBox/CurrentLabel
	Med = $VBoxContainer/MediumOrder/BuyHBox/CurrentLabel
	Lrg = $VBoxContainer/BigOrder/BuyHBox/CurrentLabel
	
	
func _cartUpdate(var size, var addSubtract):
	
	if(size == "sml" && smlAmt + addSubtract >= 0):
		smlAmt = smlAmt + addSubtract
		Sml.text = str(smlAmt) + " lb."
		
	if(size == "med" && medAmt + addSubtract >= 0):
		medAmt = medAmt + addSubtract
		Med.text = str(medAmt) + " x 2lb."
			
	if(size == "lrg" && lrgAmt + addSubtract >= 0):
		lrgAmt = lrgAmt + addSubtract
		Lrg.text = str(lrgAmt) + " x 3lb." 
				
	
	$HBoxContainer/TotalCost.text = "Total: $%0.2f" % ((smlAmt * GameManager.seasonPrices[0]) + (medAmt * GameManager.seasonPrices[1] + (lrgAmt * GameManager.seasonPrices[2])))
	pass	
func buyseasoning():
	
	var cost = (smlAmt * GameManager.seasonPrices[0]) + (medAmt * GameManager.seasonPrices[1] + (lrgAmt * GameManager.seasonPrices[2]))
	if(cost > GameManager.money):
		SoundFX.get_node("Hiss").play()
		print("Can't Afford!")
	else: #Can Afford?
		SoundFX.get_node("Register").play()
		GameManager.totalSpent = GameManager.totalSpent + cost
		GameManager.money = GameManager.money - cost # Subtracting Cost of seasoning
		GameManager.seasoning = GameManager.seasoning + (smlAmt * GameManager.seasonAmt[0]) + (medAmt * GameManager.seasonAmt[1]) + (lrgAmt * GameManager.seasonAmt[2]) #Adding seasoning to Inventory
		print ("Bought; Seasoning " + str((smlAmt * GameManager.seasonAmt[0]) + (medAmt * GameManager.seasonAmt[1]) + (lrgAmt * GameManager.seasonAmt[2])) + "lbs")
		print ("Total seasoning: " + str(GameManager.seasoning) + "lbs")
		print("Money left:$" + str(GameManager.money))
		smlAmt = 0
		medAmt = 0
		lrgAmt = 0 
		Lrg.text = str(lrgAmt) + " lb."
		Med.text = str(medAmt) + " lb."
		Sml.text = str(smlAmt) + " lb."	
		queue_free()
		
func _Exit():
	SoundFX.get_node("Doink").play()
	queue_free()
