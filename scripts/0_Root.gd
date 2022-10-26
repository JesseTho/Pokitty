extends Node2D


func _ready():
	SceneManager.LoadScene("1_Intro")
	defaultVars()
	#print("Loading Scene 1_Intro")
	pass
func defaultVars():
	GameManager.money = GameManager.startingMoney

