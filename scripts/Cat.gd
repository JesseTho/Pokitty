extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var rng = RandomNumberGenerator.new()

var startPos

var endPosx 
var endPosy 
var endPos 


func _ready():
	
	rng.randomize()
	startPos = Vector2(rng.randf_range(-1024,1024), get_viewport().size.y+100)
	
	rng.randomize()
	endPosx = rng.randf_range($"../endPos".rect_position.x,  $"../endPos".rect_position.x + $"../endPos".rect_size.x)
	endPosy = rng.randf_range($"../endPos".rect_position.y,  $"../endPos".rect_position.y + $"../endPos".rect_size.y)
	endPos = Vector2(endPosx, endPosy)
	
	self.position = startPos
	print("attempting to move")
	$Tween.interpolate_property($".", "position",startPos,endPos, 2,  Tween.EASE_IN_OUT, Tween.EASE_IN_OUT) 
	$Tween.start()
	yield($Tween, "tween_completed")
	
	if(GameManager.buyFresh()): #first check to buy fresh poke
		print("bought fresh poke!")
		GameManager.popularity+=1
		GameManager.pokeSold+=1
		get_node("NumPokeBowls").text = str(GameManager.pokeSold)
		print(":)") 
		
		
	elif(GameManager.buyFrozen()): #then check to buy frozen
		print("bought frozen poke!")
		if(GameManager.location != 1 || GameManager.location != 2): #check for location with higher standards
			GameManager.popularity+=1
			GameManager.pokeSold+=1
			get_node("NumPokeBowls").text = str(GameManager.pokeSold)
			print(":)")
		else:
			print(":|")
	
	if(!GameManager.buyFresh()&& !GameManager.buyFrozen()): #can't buy either!
		print("Can't buy poke! :(")
	
	$Tween.interpolate_property(self, "position",endPos,startPos, 2,  Tween.EASE_IN_OUT, Tween.EASE_IN_OUT) 
	$Tween.start()
	yield($Tween, "tween_completed")
	queue_free() #delete myself
# Called when the node enters the scene tree for the first time.

	
	
	
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
