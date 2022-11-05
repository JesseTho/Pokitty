extends Node2D

var CurrentTime = 8
var amPM = 0
onready var timer = get_node("Timer")
onready var catTimer = get_node("CatTimer")
onready var dayTimer = get_node("Day")
var cat 



var pokeSold = 0

func FastForward(var enabled):
	if(enabled):
		timer.wait_time = timer.wait_time/5
		timer.start()
		dayTimer.wait_time = dayTimer.wait_time/5
		dayTimer.start()
		catTimer.wait_time = timer.wait_time/CatsPerHour
		catTimer.start()
		UpdateTime()
	else:
		timer.wait_time = 5
		dayTimer.wait_time = 0.13
		catTimer.wait_time = timer.wait_time/CatsPerHour
		

var CatsPerHour 
# Called when the node enters the scene tree for the first time.
func _ready():
	StartDay()
	# Replace with function body.
	$OpentruckBg/Time.text= str(CurrentTime) + ":00AM"
	
	if(GameManager.weather == 1 || GameManager.weather == 2):
		$OpentruckBg/Clouds.visible = true
	else:
		$OpentruckBg/Clouds.visible = false	
	if(GameManager.weather == 2):
		$OpentruckBg/Rain.visible = true
	else:
		$OpentruckBg/Rain.visible = false

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$OpentruckBg/FishLB.text = str(GameManager.freshAhi + GameManager.frozenAhi) + " lbs"
	$OpentruckBg/ShoyuLB.text = str(GameManager.seasoning)  + " lbs"
	$OpentruckBg/RiceLB.text = str(GameManager.rice)  + " lbs"
	$OpentruckBg/Utensils.text = str(GameManager.utensils) + " sets"
	$OpentruckBg/NumPokeBowls.text = str(GameManager.pokeSold)
	
func _Day():
	$Light2D.rotation_degrees = $Light2D.rotation_degrees + 0.6
	
func StartDay():
	#Deduct Location Fee
		
	print("Balance after location fee is: $" + str(GameManager.money))
	GameManager.ApplyVisitorCount()
	print("Today's Visitors: " + str(GameManager.visitors))
	CatsPerHour = GameManager.visitors/12
	catTimer.wait_time = 5/CatsPerHour
	catTimer.start()
	


		
func CatsBuy():
	cat = load("res://prefab/Cat.tscn").instance()
	get_node("OpentruckBg").add_child(cat)
	print("Spawning a Cat")
	
			
	

func _on_Timer_timeout():
	UpdateTime()
	
	
	
	pass # Replace with function body.
func UpdateTime():
	
	
	if (CurrentTime >= 8 && amPM == 0 && CurrentTime < 12):
		
		
		$OpentruckBg/Time.text = str(CurrentTime) + ":00AM"
		CurrentTime+=1
		
	elif(CurrentTime == 12 && amPM == 0):
		
		$OpentruckBg/Time.text = str(CurrentTime) + ":00PM"
		amPM = 1
		
	elif(CurrentTime == 12 && amPM == 1):
		
		CurrentTime = 1
		$OpentruckBg/Time.text = str(CurrentTime) + ":00PM"
		
	
	elif(CurrentTime <= 8 && amPM == 1 ):
		$OpentruckBg/Time.text = str(CurrentTime) + ":00PM"
		CurrentTime+=1
		
	elif (CurrentTime == 9 && amPM == 1):	 #Close Shop at 8pm
		$OpentruckBg/Time.text = str(CurrentTime) + ":00PM"
		EndTurn()
	
func EndTurn():
	if(GameManager.currentDay < GameManager.days):
		
		SceneManager.LoadScene("11_ReportDay")
	
	else:
		SceneManager.LoadScene("12_ReportSeason")



