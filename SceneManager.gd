extends Node2D

var currentScene = "none"

func LoadScene(var Scene):
	#Get the Root Node
	var rootNode = get_tree().get_root().get_node("Root")

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

 
	
#Loads passed variable scene

