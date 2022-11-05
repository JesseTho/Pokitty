extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/VBoxContainer/Ahi/FrozenAmt.text = str(GameManager.frozenAhi) + " lbs"
	$HBoxContainer/VBoxContainer/Rice/RiceAmt.text = str(GameManager.rice)  + " lbs"
	$HBoxContainer/VBoxContainer2/Seasoning/SeasoningAmt.text = str(GameManager.seasoning)  + " lbs"
	$HBoxContainer/VBoxContainer2/Utensils/UtensilsAmt.text = str(GameManager.utensils) + " sets"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_InventoryPurchase_pressed():
	SoundFX.get_node("Doink").play()
	SceneManager.LoadScene("3_Location")
