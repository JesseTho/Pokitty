extends Node2D


var rng = RandomNumberGenerator.new()

func _ready(): #New Day Begins
	newDay()
	


func newDay():
	#WEATEHR 
	rng.randomize()
	GameManager.weather = rng.randi_range(0,2)
	print("Weather is: " + GameManager.weatherName[GameManager.weather])
	
	#FISH PRICES
	rng.randomize()
	var FishPrice = rng.randi_range(GameManager.fishPriceRNG[0],GameManager.fishPriceRNG[1]) 
	GameManager.frozenPrice = FishPrice
	GameManager.freshPrice = FishPrice * GameManager.fishPriceMod
	print("Frozen Fish Price:"+ str(GameManager.frozenPrice))
	print("Fresh Fish Price:"+ str(GameManager.freshPrice))

	#VISTOR COUNT
	rng.randomize()
	GameManager.visitors = rng.randi_range(GameManager.visitorRNG[0],GameManager.visitorRNG[1])
	print ("Todays Visitors: " + str(GameManager.visitors) )
	
	
	#EVENT
	rng.randomize()
	var eventToday = rng.randi_range(0,1)
	if(eventToday):
		rng.randomize()
		GameManager.event = rng.randi_range(0,GameManager.eventName.size()-1)
		print("Today's Event: " + str(GameManager.eventName[GameManager.event])) 
		
	else:
		GameManager.event = null
		print("No Event Today!")

func _on_Button_pressed():
	queue_free() #closes the news.
