extends Node
#tracked vars
var money
var popularity
var days
var currentDay
var rice
var seasoning
var utensils
var freshAhi
var frozenAhi
var location
var visitors
var tourists
var freshPrice
var frozenPrice
var event
var weather
var bowlPrice

#Game Balance 
var startingMoney = 500 #starting money
var fishPriceRNG = [10,20] #range of price of fish
var fishPriceMod = 1.25 #how much more is fresh fish compared to frozen
var weatherMod = [1.5,1,0.5] #how weather effects visitors
var touristMod = [0.5,1,2] #Tourist Modifier
var weatherName = ["Sunny","Cloudy","Rainy"]
var visitorRNG = [30,100] #range of visitors in a day
var locationName = ["Wakiki","Kalihi","Kaka'ako","North Shore"]
var locationFee = [200,100,200,100] #Fee of Location
var eventName = ["Halloween Parade", "Eddie Would Go", "Spam Fest"]
var rangeNames = ["Low","Medium","High"]
var eventMod = 2 #modifer for events if matching location
var ricePrices = [5,8,10] 
var riceAmt = [1,2,3] #Amount you can buy in lbs 
var seasonAmt = [0.5,1,2] #Amount you can buy in lbs
var utensilAmt = [20,50,100] #Amount of you can buy in Sets

func ApplyVisitorCount():
	
	#Events
	if(event == 0 && location == 0): #Halloween Parade @ Waikiki
		visitors = visitors * eventMod
	if(event == 1 && location == 3): #Eddie Would Go @ North Shore
		visitors = visitors * eventMod
	if(event == 2 && location == 0): #SpamFest @ Waikiki
		visitors = visitors * eventMod
		
	#TouristArea
	if(location == 0 || location == 3):
		visitors = visitors * touristMod[tourists]
		
	#Weather
	visitors = int(visitors * weatherMod[weather]) #forces visitor to 
	
func newDay():
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
	if(eventToday):
		rng.randomize()
		event = rng.randi_range(0,eventName.size()-1)
		print("Today's Event: " + str(eventName[event])) 
		
	else:
		event = null
		print("No Event Today!")

func _ready():
	pass


