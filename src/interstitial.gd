extends Node2D


func _ready():
	$wave.text = "wave: " + str(global.wave +1)
	$zombies.text = "zombies: " + str(game.get_total_zombies())

func _input(event):
	if event is InputEventMouseButton and event.is_action_pressed("fire"):
		get_tree().change_scene("res://src/game.tscn")
