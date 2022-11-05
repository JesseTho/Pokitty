extends Node2D


func _ready(): #New Day Begins
	GameManager.newDay()
	
	#Set text of and icons on news popup
	$HBoxContainer/Popup/Events/EventInfo.text = str(GameManager.eventName[GameManager.event])
	$HBoxContainer/Popup/HBoxContainer/Weather/CurrentWeather.text = GameManager.weatherName[GameManager.weather]
	$HBoxContainer/Popup/HBoxContainer/Weather/AnimatedSprite.frame = GameManager.weather
	$HBoxContainer/Popup/HBoxContainer/Visitor/CurrentVisitors.text = GameManager.rangeNames[GameManager.tourists]
	$HBoxContainer/Popup/Events/EventDesc.text = str(GameManager.eventDesc[GameManager.event])
	var priceCategory = _getPriceCategory()
	print("frozen:" + str(GameManager.frozenPrice))
	print("priceCategory " + str(priceCategory))
	$HBoxContainer/Popup/HBoxContainer/FishPrice/AnimatedSprite.frame = priceCategory
	$HBoxContainer/Popup/HBoxContainer/FishPrice/CurrentPrice.text = GameManager.rangeNames[priceCategory]
	
func _on_Button_pressed():
	queue_free() #closes the news.
	
	# should this be in the Game Manager?
func _getPriceCategory():
	var onethird = (GameManager.fishPriceRNG[1] - GameManager.fishPriceRNG[0])/3
	
	if (GameManager.frozenPrice <= GameManager.fishPriceRNG[0] + onethird):
		return 0 #low
	elif (GameManager.frozenPrice <= GameManager.fishPriceRNG[0] + onethird + onethird):
		return 1 #medium
	else:
		return 2 #high
