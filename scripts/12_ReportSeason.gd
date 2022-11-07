extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Background/IncExpLiquidText/IncAmt.text = "$" + str(GameManager.totalMade)
	$Background/IncExpLiquidText/ExpAmt.text = "$" + str(GameManager.totalSpent)
	$Background/IncExpLiquidText/SoldAmt.text = str(GameManager.totalSold) + "bowls!" 
	$Background/Net/NetAmt.text = "$" + str(GameManager.totalMade - GameManager.totalSpent)
	$Background/Popularity/PopAmt.text = str(GameManager.popularity)
	GameManager.checkwin()
	
	


func _on_Button_pressed():
	SceneManager.LoadScene("0_Root")
	SoundFX.get_node("CatBell").play()
	
	
