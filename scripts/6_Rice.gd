extends Node2D


var riceSml
var riceMed
var riceLrg

var smlAmt = 0
var medAmt = 0
var lrgAmt = 0

func _ready():
	
	riceSml = $VBoxContainer/SmallOrder/BuyHBox/CurrentLabel
	riceMed = $VBoxContainer/MediumOrder/BuyHBox/CurrentLabel
	riceLrg = $VBoxContainer/BigOrder/BuyHBox/CurrentLabel
	
	
func _cartUpdate(var size, var addSubtract):
	
	if(size == "sml" && smlAmt + addSubtract >= 0):
		smlAmt = smlAmt + addSubtract
		riceSml.text = str(smlAmt) + " lb."
		
	if(size == "med" && medAmt + addSubtract >= 0):
		medAmt = medAmt + addSubtract
		riceMed.text = str(medAmt) + " x 2lb."
			
	if(size == "lrg" && lrgAmt + addSubtract >= 0):
		lrgAmt = lrgAmt + addSubtract
		riceLrg.text = str(lrgAmt) + " x 3lb."
				
		
	pass	
func buyRice():
	var cost = (smlAmt * GameManager.ricePrices[0]) + (medAmt * GameManager.ricePrices[1] + (lrgAmt * GameManager.ricePrices[2]))
	if(cost > GameManager.money):
		
		print("Can't Afford!")
	else: #Can Afford?
		GameManager.money = GameManager.money - cost # Subtracting Cost of Rice
		GameManager.rice = GameManager.rice + (smlAmt * GameManager.riceAmt[0]) + (medAmt * GameManager.riceAmt[1]) + (lrgAmt * GameManager.riceAmt[2]) #Adding Rice to Inventory
		print ("Bought; Rice " + str((smlAmt * GameManager.riceAmt[0]) + (medAmt * GameManager.riceAmt[1]) + (lrgAmt * GameManager.riceAmt[2])) + "lbs")
		print ("Total Rice: " + str(GameManager.rice) + "lbs")
		print("Money left:$" + str(GameManager.money))
		smlAmt = 0
		medAmt = 0
		lrgAmt = 0 
		riceLrg.text = str(lrgAmt) + " x 3lb."
		riceMed.text = str(medAmt) + " x 2lb."
		riceSml.text = str(smlAmt) + " lb."	
func _Exit():
	queue_free()
