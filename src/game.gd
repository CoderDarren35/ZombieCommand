extends Node2D

var Zombie0 = preload("res://src/zombie0.tscn")
export var starting_lives := 10

func _ready():
	$survivorCount.text = str(starting_lives)
	
func _on_spawner_timeout():
	var zombie0 = Zombie0.instance()
	zombie0.offset = $weapons.rect_size.x
	zombie0.connect("win", self, "_on_zombie_win")
	add_child(zombie0)
	$spawner.wait_time *= 0.99


func _on_weapons_rifle(at):
	$rifle.cast_to = at - $rifle.position
	$rifle.force_raycast_update()
	if $rifle.is_colliding():
		var collider = $rifle.get_collider()
		collider.die()
	$rifle/AudioStreamPlayer.play()

func _on_zombie_win():
	var lives = int ($survivorCount.text)
	lives -= 1
	$survivorCount.text = str(lives)
	if not lives:
		get_tree().change_scene("res://src/gameover.tscn")
