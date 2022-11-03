extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var startPos = $"../startPos"
onready var endPos = $"../endPos"

func _ready():
	$"../Tween".interpolate_property($".", "position",endPos.position,startPos.position, 0.1,  Tween.EASE_IN_OUT, Tween.EASE_IN_OUT) 
	$"../Tween".start()

# Called when the node enters the scene tree for the first time.
func _Animate():
	print("attempting to move")
	$"../Tween".interpolate_property($".", "position",startPos.position,endPos.position, 1,  Tween.EASE_IN_OUT, Tween.EASE_IN_OUT) 
	yield($"../Tween", "tween_completed")
	
	if(GameManager.buyFresh() == true):
		print("bought fresh poke!")
		GameManager.popularity+=1
		GameManager.pokeSold+=1
		get_node("NumPokeBowls").text = str(GameManager.pokeSold)
		print(":)")
	elif(GameManager.buyFrozen() == true):
		print("bought frozen poke!")
		if(GameManager.location != 1 || GameManager.location != 2): #check for location with higher standards
			GameManager.popularity+=1
			GameManager.pokeSold+=1
			get_node("NumPokeBowls").text = str(GameManager.pokeSold)
			print(":)")
		else:
			print(":|")
	
	if(GameManager.buyFresh() == false && GameManager.buyFrozen() == false):
		print("Can't buy poke! :(")
	
	$"../Tween".interpolate_property($".", "position",endPos.position,startPos.position, 1,  Tween.EASE_IN_OUT, Tween.EASE_IN_OUT) 
	$"../Tween".start()
	yield($"../Tween", "tween_completed")
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
