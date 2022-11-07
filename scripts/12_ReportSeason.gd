extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Background/IncExpLiquidText/IncAmt.text = "S" + str(GameManager.totalMade)
	$Background/IncExpLiquidText/ExpAmt.text = "S" + str(GameManager.totalSpent)
	$Background/IncExpLiquidText/SoldAmt.text = str(GameManager.totalSold) + "bowls!" 
	$Background/Net/NetAmt.text = "$" + str(GameManager.totalMade - GameManager.totalSpent)
	$Background/Popularity/PopAmt.text = str(GameManager.popularity)
	
func checkwin():
	if(GameManager.money >= GameManager.MoneyWin):
		SceneManager.LoadScene("14_MoneyEnding")
	if(GameManager.popularity >= GameManager.PopularityWin):
		SceneManager.LoadScene("15_PopularEnding")
	if(GameManager.popularity >= GameManager.PopMoneyWin[0] && GameManager.money >= GameManager.PopMoneyWin[1]):
		pass 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	SoundFX.get_node("CatBell").play()
	SceneManager.LoadScene("0_Root")
