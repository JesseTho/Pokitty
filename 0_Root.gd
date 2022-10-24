extends Node2D


func _ready():
	SceneManager.LoadScene("1_Intro")
	#print("Loading Scene 1_Intro")
	pass
func defaultVars():
	GameManager.money = 500 #starting money


