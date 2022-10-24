extends Node2D

func _ready(): #LOAD NEWS POPUP
	var LoadScene = load("res://4_News.tscn").instance()
	add_child(LoadScene)
	pass # Replace with function body.

func _on_Button_pressed(var SceneName, var location):
	SceneManager.LoadScene(SceneName)
	GameManager.location = location
	
	print("Location:" + GameManager.locationName[GameManager.location] + " Money:" + str(GameManager.money) )
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
