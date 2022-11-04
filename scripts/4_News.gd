extends Node2D


func _ready(): #New Day Begins
	GameManager.newDay()

	$HBoxContainer/Popup/Events2/EventInfo.text = str(GameManager.eventName[GameManager.event])

func _on_Button_pressed():
	queue_free() #closes the news.
