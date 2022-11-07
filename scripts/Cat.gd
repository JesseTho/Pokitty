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
	
	$CatAnimated/AnimationPlayer.play("CatIdle")
	
	rng.randomize()
	var catTexture = load("res://images/cat_sprite" + str(rng.randi_range(1,4)) + ".png")
	$CatAnimated/Tail.texture = catTexture
	$CatAnimated/Head.texture = catTexture
	$CatAnimated/Body.texture = catTexture
	
	#self.texture = load("res://images/cat" + str(rng.randi_range(1,4)) + ".png")
	
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
		GameManager.likesDay+=1
		$AnimatedSprite.visible = true
		$AnimatedSprite.frame = 1
		$Poke.visible = true
		SoundFX.get_node("Meow").play()# like
		print(":)") 
		
		
	elif(GameManager.buyFrozen()): #then check to buy frozen
		print("bought frozen poke!")
		if(GameManager.location == 0 || GameManager.location == 2): #check for location with low standards
			GameManager.popularity+=1
			GameManager.likesDay+=1
			$AnimatedSprite.visible = true
			$AnimatedSprite.frame = 1
			$Poke.visible = true
			SoundFX.get_node("Meow").play()# like
			print(":)")
		else:
			$AnimatedSprite.visible = true
			$AnimatedSprite.frame = 2
			SoundFX.get_node("Hiss").play()# don't like
			print(":|")
			
	
	if(!GameManager.buyFresh()&& !GameManager.buyFrozen()): #can't buy either!
		print("Can't buy poke! :(")
		$AnimatedSprite.visible = true
		$AnimatedSprite.frame = 0
	
	$Tween.interpolate_property(self, "position",endPos,startPos, 2,  Tween.EASE_IN_OUT, Tween.EASE_IN_OUT) 
	$Tween.start()
	yield($Tween, "tween_completed")
	queue_free() #delete myself
# Called when the node enters the scene tree for the first time.

	
	
	
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
