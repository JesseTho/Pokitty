extends Node2D


func _ready(): #New Day Begins
	GameManager.newDay()
	

func _on_Button_pressed():
	queue_free() #closes the news.
