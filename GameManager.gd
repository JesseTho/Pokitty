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
var weatherName = ["Sunny","Cloudy","Rainy"]
var visitorRNG = [30,100] #range of visitors in a day
var locationName = ["Wakiki","Kalihi","Kaka'ako","North Shore"]
var locationFee = [200,100,200,100] #Fee of Location
var eventName = ["Halloween Parade", "Eddie Would Go", "Spam Fest"]
var ricePrices = [5,8,10] 
var riceAmt = [1,2,3] #Amount you can buy in lbs 
var seasonAmt = [0.5,1,2] #Amount you can buy in lbs
var utensilAmt = [20,50,100] #Amount of you can buy in Sets


func _ready():
	pass


