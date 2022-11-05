extends Node2D

func _ready(): #LOAD NEWS POPUP
	SceneManager.LoadDialog("4_News")

func _on_Button_pressed(var SceneName, var location):
	
	GameManager.location = location
	
	if(GameManager.money - GameManager.locationFee[GameManager.location] > GameManager.locationFee[GameManager.location]): #Check to see if user can afford location fee
		GameManager.money = GameManager.money - GameManager.locationFee[GameManager.location]
		GameManager.totalSpent = GameManager.totalSpent + GameManager.locationFee[GameManager.location]
		SceneManager.LoadScene(SceneName)
	else:
		print("Broke, can't pay for location")
		SceneManager.LoadScene("13_Bankrupt")
	
	
	print("Location:" + GameManager.locationName[GameManager.location] + " Money:" + str(GameManager.money) )
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
