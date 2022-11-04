extends Node2D


func _ready(): #New Day Begins
	GameManager.newDay()
	
	#Set text of and icons on news popup
	$HBoxContainer/Popup/Events2/EventInfo.text = str(GameManager.eventName[GameManager.event])
	$HBoxContainer/Popup/HBoxContainer/Weather/CurrentWeather.text = GameManager.weatherName[GameManager.weather]
	$HBoxContainer/Popup/HBoxContainer/Weather/AnimatedSprite.frame = GameManager.weather
	$HBoxContainer/Popup/HBoxContainer/Visitor/CurrentVisitors.text = GameManager.rangeNames[GameManager.tourists]
	
	var onethird = (GameManager.fishPriceRNG[1] - GameManager.fishPriceRNG[0])/3
	var priceCategory
	
	if (GameManager.frozenPrice <= GameManager.fishPriceRNG[0] + onethird):
		priceCategory = 0
	elif (GameManager.frozenPrice <= GameManager.fishPriceRNG[0] + onethird + onethird):
		priceCategory = 1
	else:
		priceCategory = 2
	
	print("frozen:" + str(GameManager.frozenPrice))
	print("priceCategory " + str(priceCategory))
	
	$HBoxContainer/Popup/HBoxContainer/FishPrice/AnimatedSprite.frame = priceCategory
	$HBoxContainer/Popup/HBoxContainer/FishPrice/CurrentPrice.text = GameManager.rangeNames[priceCategory]
	
func _on_Button_pressed():
	queue_free() #closes the news.
