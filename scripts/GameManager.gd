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

#Game Balance 
var startingMoney = 500 #starting money
var fishPriceRNG = [10,20] #range of price of fish
var fishPriceMod = 1.25 #how much more is fresh fish compared to frozen
var weatherMod = [1.2,1,0.8] #how weather effects visitors
var touristMod = [0.8,1,1.25] #Tourist Modifier
var weatherName = ["Sunny","Cloudy","Rainy"]
var visitorRNG = [12,50] #range of visitors in a day
var locationName = ["Wakiki","Kalihi","Pearl City","North Shore"]
var locationFee = [200,100,200,100] #Fee of Location
var eventName = ["No Event Today","Halloween Parade", "Eddie Would Go", "Spam Fest"]
var rangeNames = ["Low","Medium","High"]
var eventMod = 2 #modifer for events if matching location
var ricePrices = [5,8,10] 
var riceAmt = [1,2,3] #Amount you can buy in lbs 
var seasonPrices = [5,8,10] #prices for seasoning
var seasonAmt = [0.5,1,2] #Amount you can buy in lbs
var utensilPrices = [5,8,10] 
var utensilAmt = [20,50,100] #Amount of you can buy in Sets
#Price Mods
var buyRange = 12
var freshMod = 1.2
var touristPriceMod =  1.6
var locationPriceMod = [1.5,1,0.9,1.1]
var touristlocationMod = [1,0,0,1]
var popularityMod = 1 + (popularity * 0.001)



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
	
	
	touristPriceMod =  (touristMod[tourists] * touristlocationMod[location])  
	popularityMod = 1 + (popularity * 0.001)
	var maxCost = buyRange * locationPriceMod[location] * popularityMod * touristPriceMod * freshMod 
	print("Max can charge: $" + str(maxCost))
	if(bowlPrice <= maxCost):
		return true
	else:
		return false


func priceCheckFrozen():
	
	#freshMod = 1.2
	touristPriceMod =  (touristMod[tourists] * touristlocationMod[location])  
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
		return true	
	else:
		return false
	
func _ready():
	pass


