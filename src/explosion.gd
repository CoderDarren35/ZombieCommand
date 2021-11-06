extends Area2D



func _physics_process(delta):
	for collider in get_overlapping_bodies():
		collider.queue_free()


func _on_Timer_timeout():
	queue_free()
