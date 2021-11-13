extends Node2D

var Zombie0 = preload("res://src/zombie0.tscn")


func _on_spawner_timeout():
	var zombie0 = Zombie0.instance()
	zombie0.offset = $weapons.rect_size.x
	add_child(zombie0)


func _on_weapons_rifle(at):
	$rifle.cast_to = at - $rifle.position
	$rifle.force_raycast_update()
	if $rifle.is_colliding():
		var collider = $rifle.get_collider()
		collider.queue_free()
	$rifle/AudioStreamPlayer
