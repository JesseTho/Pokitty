extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var expiredAhi 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	expiredAhi = GameManager.freshAhi
	GameManager.freshAhi = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	SceneManager.LoadScene("3_Location")
