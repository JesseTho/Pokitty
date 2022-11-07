extends Node
#tracked vars
var money
var popularity = 0
var days = 0
var currentDay = 0
var rice = 0
var seasoning = 0
var utensils = 0
var freshAhi = 0
var frozenAhi = 0
var location 
var visitors
var tourists
var freshPrice
var frozenPrice
var event
var weather
var bowlPrice = 12  #starting bowl price
var pokeSold = 0
var totalSpent = 0
var totalMade = 0
var totalSold = 0
var likesDay = 0

#Game Balance 
var startingMoney = 500 #starting money
var fishPriceRNG = [5,10] #range of price of fish
var fishPriceMod = 1.25 #how much more is fresh fish compared to frozen
var weatherMod = [1.2,1,0.8] #how weather effects visitors
var touristMod = [0.8,1,1.25] #Tourist Modifier
var weatherName = ["Sunny","Cloudy","Rainy"]
var visitorRNG = [12,50] #range of visitors in a day
var locationName = ["Wakiki","Kalihi","Pearl City","North Shore"]
var locationFee = [100,50,40,75] #Fee of Location
var eventName = ["No Event Today","Halloween Parade", "Eddie Would Go", "Spam Jam"]
var eventDesc = ["Purrfect day if you ask us!","Halloween night draws thousands of people in costume walking through Wakiki.","The Eddie is the biggest surfing event the world, only held when the surf height in the North Shore reaches 20ft.","Spam Jam is a food festival in Waikiki that celebrates everyones favorite canned meat SPAM® "]
var rangeNames = ["Low","Medium","High"]
var eventMod = 2 #modifer for events if matching location
var ricePrices = [1,3,10] 
var riceAmt = [1,4,15]#Amount you can buy in lbs 
var seasonPrices = [5,8,10] #prices for seasoning
var seasonAmt = [1,2,3] #Amount you can buy in lbs
var utensilPrices = [5,8,10] 
var utensilAmt = [20,50,100] #Amount of you can buy in Sets.

#Price Mods
var buyRange = 12
var freshMod = 1.3
var touristPriceMod =  1.6
var locationPriceMod = [1.5,1,0.9,1.1] #
var locationExpectationNames = ["Moderate", "High", "Moderate", "High"]
var touristlocationMod = [1,0,0,1]
var popularityMod = 1 + (popularity * 0.001)

#Win Conditions
var PopularityWin= 30 #Win is over 
var MoneyWin = 500 
var PopMoneyWin = [20,300] #popularity and money
var MoneyOffer = 0
var PopOffer = 0



#Calculations
func ApplyVisitorCount():
	
	#Events
	if(event == 1 && location == 0): #Halloween Parade @ Waikiki
		visitors = visitors * eventMod
		
	if(event == 2 && location == 3): #Eddie Would Go @ North Shore
		visitors = visitors * eventMod
	if(event == 3 && location == 0): #SpamFest @ Waikiki
		visitors = visitors * eventMod
		
	#TouristArea
	if(location == 0 || location == 3):
		visitors = visitors * touristMod[tourists]
		
	#Weather
	visitors = int(visitors * weatherMod[weather]) #forces visitor to 
	
	if(visitors < visitorRNG[0]): #sets min visitors per day to 1 (1 per hour)
		visitors = visitorRNG[0]

#Day Stats Caculated in 4_News	
func newDay():
	#New Day!
	currentDay+=1
	print("Day:"+str(currentDay) + " of " + str(days))
	var rng = RandomNumberGenerator.new()
	#WEATEHR 
	
	rng.randomize()
	weather = rng.randi_range(0,2)
	print("Weather is: " + weatherName[weather])
	
	#FISH PRICES
	rng.randomize()
	var FishPrice = rng.randi_range(fishPriceRNG[0],fishPriceRNG[1]) 
	frozenPrice = FishPrice
	freshPrice = FishPrice * fishPriceMod
	print("Frozen Fish Price:"+ str(frozenPrice))
	print("Fresh Fish Price:"+ str(freshPrice))

	#BASE VISITOR COUNT
	rng.randomize()
	visitors = rng.randi_range(visitorRNG[0],visitorRNG[1])
			
	#TOURISTS
	rng.randomize()
	tourists = rng.randi_range(0,2)
	print ("Base Visitors: " + str(visitors) + " Tourists: " + str(rangeNames[tourists]))
	
	#EVENTS
	rng.randomize()
	var eventToday = rng.randi_range(0,1)
	if(eventToday == 1):
		rng.randomize()
		event = rng.randi_range(1,eventName.size()-1)
		print("Today's Event: " + str(eventName[event])) 
		
	else:
		event = 0
		print("No Event Today!")
	
func priceCheckFresh():
	
	if(touristlocationMod[location] == 1):
		touristPriceMod =  (touristMod[tourists])
	else:
		touristPriceMod = 1
		
	
	print("Tourist Price Mod " + str(touristPriceMod))
	popularityMod = 1 + (popularity * 0.001)
	var maxCost = buyRange * locationPriceMod[location] * popularityMod  * freshMod * touristPriceMod
	print("Max can charge: $" + str(maxCost))
	if(bowlPrice <= maxCost):
		return true
	else:
		return false


func priceCheckFrozen():
	
	#freshMod = 1.2
	if(touristlocationMod[location] == 1):
		touristPriceMod =  (touristMod[tourists])
	else:
		touristPriceMod = 1
		
	popularityMod = 1 + (popularity * 0.001)
	var maxCost = buyRange * locationPriceMod[location] * popularityMod * touristPriceMod
	print("Max can charge: $" + str(maxCost))
	if(bowlPrice <= maxCost):
		return true
	else:
		return false




func buyFresh():
	if(freshAhi >= 0.5 && rice >= 0.5 && utensils >= 1 && seasoning >= 0.25 && priceCheckFresh()):
		freshAhi-=0.5
		rice-=0.5
		utensils-=1
		seasoning-=0.25
		money = money+bowlPrice
		totalMade = totalMade+bowlPrice
		pokeSold+=1
		totalSold+=1
		return true ## 
	else:
		return false
	
func buyFrozen():
	if(frozenAhi >= 0.5 && rice >= 0.5 && utensils >= 1 && seasoning >= 0.25 && priceCheckFrozen()):
		frozenAhi-=0.5
		rice-=0.5
		utensils-=1
		seasoning-=0.25
		money = money+bowlPrice
		totalMade = totalMade+bowlPrice
		pokeSold+=1
		totalSold+=1
		return true	
	else:
		return false
	
func _ready():
	pass


func _resetGame():
	money = 50
	popularity = 0
	days = 0
	currentDay = 0
	rice = 0
	seasoning = 0
	utensils = 0
	freshAhi = 0
	frozenAhi = 0
	pokeSold = 0
	totalSpent = 0
	totalMade = 0
	totalSold = 0

func checkwin():
	if(money >= MoneyWin * days && MoneyOffer == 0):
		SceneManager.LoadDialog("14_MoneyEnding")
		return
	if(popularity >= PopularityWin * days && PopOffer == 0):
		SceneManager.LoadDialog("15_PopularEnding")
		return
	#if(GameManager.popularity >= GameManager.PopMoneyWin[0] * GameManager.days && GameManager.money >= GameManager.PopMoneyWin[1] * GameManager.days):
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

