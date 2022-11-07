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
	
	
	
func checkwin():
	if(GameManager.money >= GameManager.MoneyWin * GameManager.days):
		SceneManager.LoadScene("14_MoneyEnding")
	if(GameManager.popularity >= GameManager.PopularityWin * GameManager.days ):
		SceneManager.LoadScene("15_PopularEnding")
	#if(GameManager.popularity >= GameManager.PopMoneyWin[0] * GameManager.days && GameManager.money >= GameManager.PopMoneyWin[1] * GameManager.days):
	
	else:
		SceneManager.LoadScene("0_Root")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	SoundFX.get_node("CatBell").play()
	checkwin()
	
