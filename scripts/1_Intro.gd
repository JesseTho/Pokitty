extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	SoundFX.get_node("RelaxingGuitar").play()
	pass

func _on_Button_pressed(var SceneName):
	SoundFX.get_node("Doink").play()
	SceneManager.LoadScene(SceneName)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
