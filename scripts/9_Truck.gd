extends Node2D

var CurrentTime = 8
var amPM = 0
onready var timer = get_node("Timer")
# Called when the node enters the scene tree for the first time.
func _ready():
	StartDay()
	pass # Replace with function body.
	$OpentruckBg/Time.text= str(CurrentTime) + ":00AM"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func StartDay():
	#Deduct Location Fee
		
	print("Balance after location fee is: $" + str(GameManager.money))
	GameManager.ApplyVisitorCount()
	print("Today's Visitors: " + str(GameManager.visitors))


func UpdateTime():
	
	if (CurrentTime >= 8 && amPM == 0 && CurrentTime < 12):
		CurrentTime+=1
		$OpentruckBg/Time.text = str(CurrentTime) + ":00AM"
		return	
		
	elif(CurrentTime == 12 && amPM == 0):
		CurrentTime = 1
		amPM = 1
		$OpentruckBg/Time.text = str(CurrentTime) + ":00PM"
	
	elif(CurrentTime < 8 && amPM == 1):
		CurrentTime+=1
		$OpentruckBg/Time.text = str(CurrentTime) + ":00PM"
		
		
	if (CurrentTime == 8 && amPM == 1):	 #Close Shop at 8pm
		EndTurn()
	
func EndTurn():
	if(GameManager.currentDay < GameManager.days):
		
		SceneManager.LoadScene("11_ReportDay")
	
	else:
		SceneManager.LoadScene("12_ReportSeason")

func _on_Timer_timeout():
	UpdateTime()
	
	
	pass # Replace with function body.
