extends Node2D

var currentScene = "none"
var rootNode

func LoadScene(var Scene):
	#Get the Root Node
	rootNode = get_tree().get_root().get_node("Root")

	var LoadScene = load("res://" + Scene + ".tscn").instance()
	LoadScene.name = Scene
	#Remove Old Scene
	if(currentScene != "none"):
		var oldScene = rootNode.get_node(currentScene)
		rootNode.remove_child(oldScene)
	#Loading Scene	
	rootNode.add_child(LoadScene)
	currentScene = Scene
	print("Loading " + Scene)

func LoadDialog(var Scene): #For Menus with Exit Buttons
	var LoadScene = load("res://"+ str(Scene)+".tscn").instance()
	rootNode.add_child(LoadScene)
	pass # Replace with function body.
	
#Loads passed variable scene

