extends Node2D

var Zombie0 = preload("res://src/zombie0.tscn")


func _on_spawner_timeout():
	var zombie0 = Zombie0.instance()
	add_child(zombie0)
