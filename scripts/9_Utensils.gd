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
		Sml.text = str(smlAmt) + " x 20 ct"
		
	if(size == "med" && medAmt + addSubtract >= 0):
		medAmt = medAmt + addSubtract
		Med.text = str(medAmt) + " x 50 ct"
			
	if(size == "lrg" && lrgAmt + addSubtract >= 0):
		lrgAmt = lrgAmt + addSubtract
		Lrg.text = str(lrgAmt) + " x 100 ct" 
				
		
	pass	
func _buy():
	var cost = (smlAmt * GameManager.utensilPrices[0]) + (medAmt * GameManager.utensilPrices[1] + (lrgAmt * GameManager.utensilPrices[2]))
	if(cost > GameManager.money):
		
		print("Can't Afford!")
	else: #Can Afford?
		GameManager.totalSpent = GameManager.totalSpent + cost
		GameManager.money = GameManager.money - cost # Subtracting Cost of utensils
		GameManager.utensils = GameManager.utensils + (smlAmt * GameManager.utensilAmt[0]) + (medAmt * GameManager.utensilAmt[1]) + (lrgAmt * GameManager.utensilAmt[2]) #Adding utensils to Inventory
		print ("Bought; utensils " + str((smlAmt * GameManager.utensilAmt[0]) + (medAmt * GameManager.utensilAmt[1]) + (lrgAmt * GameManager.utensilAmt[2])) + "sets")
		print ("Total utensils: " + str(GameManager.utensils) + "sets")
		print("Money left:$" + str(GameManager.money))
		smlAmt = 0
		medAmt = 0
		lrgAmt = 0 
		Lrg.text = str(lrgAmt) + " ct."
		Med.text = str(medAmt) + " ct."
		Sml.text = str(smlAmt) + " ct."	
		queue_free()
		
func _Exit():
	queue_free()
